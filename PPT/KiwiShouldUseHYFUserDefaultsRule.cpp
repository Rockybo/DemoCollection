#include "oclint/AbstractASTVisitorRule.h"
#include "oclint/RuleSet.h"
#include "oclint/util/ASTUtil.h"

using namespace std;
using namespace clang;
using namespace oclint;

class KiwiShouldUseHYFUserDefaultsRule : public AbstractASTVisitorRule<KiwiShouldUseHYFUserDefaultsRule>
{
public:
    string ignoreFlag;
    string mainFileName;
    vector<unsigned> ignoreLines;
    
    virtual const string name() const override
    {
        return "kiwi should use hyfuserdefaults";
    }

    virtual int priority() const override
    {
        return 3;
    }

    virtual const string category() const override
    {
        return "custom";
    }

#ifdef DOCGEN
    virtual const std::string since() const override
    {
        return "21.10";
    }

    virtual const std::string description() const override
    {
        return "Kiwi should use HYFUserDefaults to avoid ANR";
    }

    virtual const std::string example() const override
    {
        return R"rst(
.. code-block:: cpp

    void example()
    {
        // TODO: modify the example for this rule.
    }
        )rst";
    }

    /* fill in the file name only when it does not match the rule identifier
    virtual const std::string fileName() const override
    {
        return "";
    }
    */

    /* add each threshold's key, description, and its default value to the map.
    virtual const std::map<std::string, std::string> thresholds() const override
    {
        std::map<std::string, std::string> thresholdMapping;
        return thresholdMapping;
    }
    */

    /* add additional document for the rule, like references, notes, etc.
    virtual const std::string additionalDocument() const override
    {
        return "";
    }
    */

    /* uncomment this method when the rule is enabled to be suppressed.
    virtual bool enableSuppress() const override
    {
        return true;
    }
    */
#endif
    void setIgnoreFlag ()
    {
        ignoreFlag = "safe@oclint";
        clang::SourceManager *sourceManager = &_carrier->getSourceManager();

        FileID mainFileID = sourceManager->getMainFileID();
        StringRef mainFileStringRef = sourceManager->getBufferData(mainFileID);

        StringRef remaining = mainFileStringRef;
        int currentLineNumber = 1;
        while (remaining.size() > 0)
        {
            std::pair<llvm::StringRef, llvm::StringRef> splitPair = remaining.split('\n');
            llvm::StringRef currentLine = splitPair.first;
            int idx = currentLine.str().find(ignoreFlag);
            if (idx != string::npos) {
                ignoreLines.push_back(currentLineNumber);
            }
            remaining = splitPair.second;
            currentLineNumber++;
        }
    }
    virtual void setUp() override {
        setIgnoreFlag();
    }
    virtual void tearDown() override {}
    
    bool checkShouldIgnore (unsigned line)
    {
        for (unsigned currentLine : ignoreLines) {
            if (currentLine == line) {
                return true;
            }
        }
        return false;
    }
    
    bool VisitObjCMessageExpr(ObjCMessageExpr *node)
    {
        ObjCInterfaceDecl *objCInterfaceDecl = node->getReceiverInterface();

        if (!objCInterfaceDecl) {
            return true;
        }
        
        string selectorName = node->getSelector().getAsString();
        if (selectorName.length() <= 0) {
            return true;
        }
        
        if (isObjCInterfaceClassOrSubclass(objCInterfaceDecl, "NSUserDefaults") && selectorName
            != "standardUserDefaults") {
            clang::SourceManager *sourceManager = &_carrier->getSourceManager();
            PresumedLoc loc = sourceManager->getPresumedLoc(node->getBeginLoc());
            if (checkShouldIgnore(loc.getLine())) {
                return true;
            }
            addViolation(node, this);
        }
        return true;
    }
};

static RuleSet rules(new KiwiShouldUseHYFUserDefaultsRule());
