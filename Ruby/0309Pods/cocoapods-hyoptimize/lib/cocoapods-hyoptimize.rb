require 'cocoapods-hyoptimize/gem_version'
require 'fileutils'
require 'uri'
require 'zlib'
require 'cocoapods-downloader/remote_file'

require 'active_support/core_ext/string/strip'

# hook for time stat
module Pod

  $podsPhase = {}
  class Installer

    alias :origin_install! :install!
    def install!
      start_time = Time.new
      show_begin_time(__method__, start_time)
      origin_install!
      end_time = Time.new
      show_end_time("#{__method__}, pods_installed: #{root_specs.size}", start_time)

      cost = (end_time - start_time) * 1000
      puts "install_cost: #{cost} ms"
      $podsPhase = {"install_cost" => cost}
      $podsPhase = {"install_num" => root_specs.size}

    end


    alias :origin_prepare :prepare
    def prepare
      start_time = Time.new
      show_begin_time(__method__, start_time)
      origin_prepare
      end_time = Time.new
      show_end_time(__method__, start_time)

      cost = (end_time - start_time) * 1000
      puts "prepare_cost: #{cost} ms"
      $podsPhase = {"prepare_cost" => cost}

    end
  

    alias :origin_resolve_dependencies :resolve_dependencies
    def resolve_dependencies
      start_time = Time.new
      show_begin_time(__method__, start_time)
      origin_resolve_dependencies
      end_time = Time.new
      show_end_time(__method__, start_time)

      cost = (end_time - start_time) * 1000
      puts "download_dependencies_cost: #{cost} ms"
      $podsPhase = {"download_dependencies_cost" => cost}

    end


    alias :origin_analyze :analyze
    def analyze(analyzer = create_analyzer)
      start_time = Time.new
      show_begin_time(__method__, start_time)
      origin_analyze(analyzer)
      end_time = Time.new
      show_end_time(__method__, start_time)

      cost = (end_time - start_time) * 1000
      puts "analyze_cost: #{cost} ms"
      $podsPhase = {"analyze_cost" => cost}

    end


    alias :origin_download_dependencies :download_dependencies
    def download_dependencies
      start_time = Time.new
      show_begin_time(__method__, start_time)
      origin_download_dependencies
      end_time = Time.new
      show_end_time(__method__, start_time)

      cost = (end_time - start_time) * 1000
      puts "download_dependencies_cost: #{cost} ms"
      $podsPhase = {"download_dependencies_cost" => cost}

    end


    alias :origin_validate_targets :validate_targets
    def validate_targets
      start_time = Time.new
      show_begin_time(__method__, start_time)
      origin_validate_targets
      end_time = Time.new
      show_end_time(__method__, start_time)

      cost = (end_time - start_time) * 1000
      puts "validate_targets_cost: #{cost} ms"
      $podsPhase = {"validate_targets_cost" => cost}

    end


    alias :origin_integrate :integrate
    def integrate
      start_time = Time.new
      show_begin_time(__method__, start_time)
      origin_integrate
      end_time = Time.new
      show_end_time(__method__, start_time)

      cost = (end_time - start_time) * 1000
      puts "integrate_cost: #{cost} ms"
      $podsPhase = {"integrate_cost" => cost}

    end


    alias :origin_write_lockfiles :write_lockfiles
    def write_lockfiles
      start_time = Time.new
      show_begin_time(__method__, start_time)
      origin_write_lockfiles
      end_time = Time.new
      show_end_time(__method__, start_time)

      cost = (end_time - start_time) * 1000
      puts "write_lockfiles_cost: #{cost} ms"
      $podsPhase = {"write_lockfiles_cost" => cost}

    end


    alias :origin_perform_post_install_actions :perform_post_install_actions
    def perform_post_install_actions
      start_time = Time.new
      show_begin_time(__method__, start_time)
      origin_perform_post_install_actions
      end_time = Time.new
      show_end_time(__method__, start_time)

      cost = (end_time - start_time) * 1000
      puts "perform_post_install_actions_cost: #{cost} ms"
      $podsPhase = {"perform_post_install_actions_cost" => cost}

    end


    alias :origin_install_pod_sources :install_pod_sources
    def install_pod_sources
      start_time = Time.new
      use_http_download = ENV['HYPOD_USE_HTTP_DOWNLOAD'] == 'true'

      show_begin_time("#{__method__}, HYPOD_USE_HTTP_DOWNLOAD: #{use_http_download}", start_time)
    

      @installed_specs = []
      pods_to_install = sandbox_state.added | sandbox_state.changed
      title_options = { :verbose_prefix => '-> '.green }
      root_specs.sort_by(&:name).each do |spec|
        if pods_to_install.include?(spec.name)
          if sandbox_state.changed.include?(spec.name) && sandbox.manifest
            current_version = spec.version
            previous_version = sandbox.manifest.version(spec.name)
            has_changed_version = current_version != previous_version
            current_repo = analysis_result.specs_by_source.detect { |key, values| break key if values.map(&:name).include?(spec.name) }
            current_repo &&= (Pod::TrunkSource::TRUNK_REPO_NAME if current_repo.name == Pod::TrunkSource::TRUNK_REPO_NAME) || current_repo.url || current_repo.name
            previous_spec_repo = sandbox.manifest.spec_repo(spec.name)
            has_changed_repo = !previous_spec_repo.nil? && current_repo && !current_repo.casecmp(previous_spec_repo).zero?
            title = "Installing #{spec.name} #{spec.version}"
            title << " (was #{previous_version} and source changed to `#{current_repo}` from `#{previous_spec_repo}`)" if has_changed_version && has_changed_repo
            title << " (was #{previous_version})" if has_changed_version && !has_changed_repo
            title << " (source changed to `#{current_repo}` from `#{previous_spec_repo}`)" if !has_changed_version && has_changed_repo
          else
            title = "Installing #{spec}"
          end
          show_message "[hyhook] will install " + spec.name + " in thread: " + Thread.current.object_id.to_s
          UI.titled_section(title.green, title_options) do
            #git下载替换成http下载
            # if use_http_download
            #   downloadWayForHttp(spec)
            # end
            install_source_of_pod(spec.name)
          end
        else
          UI.section("Using #{spec}", title_options[:verbose_prefix]) do
            show_message "[hyhook] create_pod_installer " + spec.name.to_s
            create_pod_installer(spec.name)
          end
        end
      end
      end_time = Time.new
      show_end_time(__method__, start_time)

      cost = (end_time - start_time) * 1000
      puts "install_pod_sources_cost: #{cost} ms"
      $podsPhase = {"install_pod_sources_cost" => cost}

    end

    def show_begin_time(key, start_time)
      show_message '[hyhook] will call %s, %s' % [key, start_time.to_s]
    end


    def show_end_time(key, start_time)
      end_time = Time.new
      show_message '[hyhook] did call %s, %s, cost: %.2f' % [key, end_time.to_s, end_time.to_f - start_time.to_f]
    end

    def writeCVS(content)
      # 写入数据到cvs workspace | phase | build_num | installed_count | start_time | end_time | cost
      CSV.open("#{Dir.home}/.AllPodsTimeAndSize.csv", "a+") do |csv|
        csv << content
      end
    end

    def show_message(msg)
      #puts "\033[33m" + msg + "\033[0m"
      puts msg.green
    end
  end
  
end


module Pod
  module Downloader
    # The class responsible for managing Pod downloads, transparently caching
    # them in a cache directory.
    #
    class Cache
        @file_path_short = ""
        alias :origin_copy_and_clean :copy_and_clean
        def copy_and_clean(source, destination, spec)
          # source 已经是解压zip包后的目录文件
          # source #<Pathname:/var/folders/sq/4y9z6d0n45db19_c4ky4ldd40000gn/T/d20220311-81812-3tk1hw>
          specs_by_platform = group_subspecs_by_platform(spec)
          destination.parent.mkpath
          FileUtils.rm_rf(destination)
          # if spec.name == "OfflineResourceManager"
          #   puts "OfflineResourceManager"
          # end
          # 判断一下是github且是http下载
          # source = "#{source}/#{spec.name}-#{spec.version.version}"
          use_http_download = ENV['HYPOD_USE_HTTP_DOWNLOAD'] == 'true'
          if use_http_download and $is_use_http
            traverse(source, spec)
            source = @file_path_short
          end
          # destination：<Pathname:/Users/libolin/Library/Caches/CocoaPods/Pods/Release/SDWebImage/5.12.3-53179>
          FileUtils.cp_r(source, destination)
          Pod::Installer::PodSourcePreparer.new(spec, destination).prepare!
          # 用于清理增量pod 安装中的无用headers、target、support files 目录
          Sandbox::PodDirCleaner.new(destination, specs_by_platform).clean!
        end

        def dirList(filepath)
          arr = Dir.entries(filepath)
          arr.delete('.')
          arr.delete('..')
          arr.delete('.DS_Store')
          return arr
      end
      
      def traverse(filepath, spec)
          file_path = "#{filepath}"
          arr = dirList(file_path)
          if arr.class == Array and arr.size() == 1 and arr[0].include?('podspec')
            arr.clear
          end
          if !file_path.nil? and File.directory?(file_path) and arr.class == Array and arr.size() == 1 and arr[0] != spec.name
              # puts "Dirs:" + filepath
              Dir.foreach(file_path) do |filename|
                  next if filename == '.' or filename == '..' or filename == '.DS_Store' or filename.include?('podspec')
                  traverse(file_path + "/" + filename, spec)
              end
          else
              puts "Files:"+ file_path
              @file_path_short = file_path
          end
      end

    end

    # 软连接
    def self.download(
      request,
      target,
      can_cache: true,
      cache_path: Config.instance.cache_root + 'Pods'
    )
      can_cache &&= !Config.instance.skip_download_cache

      request = preprocess_request(request)

      if can_cache
        raise ArgumentError, 'Must provide a `cache_path` when caching.' unless cache_path
        cache = Cache.new(cache_path)
        result = cache.download_pod(request)
      else
        raise ArgumentError, 'Must provide a `target` when caching is disabled.' unless target

        require 'cocoapods/installer/pod_source_preparer'
        result, = download_request(request, target)
        Installer::PodSourcePreparer.new(result.spec, result.location).prepare!
      end

      if target && result.location && target != result.location
        UI.message "Copying #{request.name} from `#{result.location}` to #{UI.path target}", '> ' do
          FileUtils.ln_s(result.location, target, force: true)
        end
      end
      result
    end


  end
end


# 替换解压
module Pod
  module Downloader
    class RemoteFile < Base

      executable :ditto
      # 替换解压
      alias :origin_extract_with_type :extract_with_type
      def extract_with_type(full_filename, type = :zip)
        unpack_from = full_filename
        unpack_to = @target_path

        case type
        when :zip
          # unzip! unpack_from, '-d', unpack_to
          ditto! '-x', '-k', '--sequesterRsrc', '-rsrc', unpack_from, unpack_to
        when :tar, :tgz, :tbz, :txz
          tar! 'xf', unpack_from, '-C', unpack_to
        when :dmg
          extract_dmg(unpack_from, unpack_to)
        else
          raise UnsupportedFileTypeError, "Unsupported file type: #{type}"
        end

        # If the archive is a tarball and it only contained a folder, move its
        # contents to the target (#727)
        #
        if should_flatten?
          contents = target_path.children
          contents.delete(target_path + @filename)
          entry = contents.first
          if contents.count == 1 && entry.directory?
            tmp_entry = entry.sub_ext("#{entry.extname}.tmp")
            begin
              FileUtils.move(entry, tmp_entry)
              FileUtils.move(tmp_entry.children, target_path)
            ensure
              FileUtils.remove_entry(tmp_entry)
            end
          end
        end

        FileUtils.rm(unpack_from) if File.exist?(unpack_from)
      end

    end
  end
end


 # 修改spec的source值
    # alias :origin_install_source_of_pod :install_source_of_pod
    # def install!
    #   download_source unless predownloaded? || local?
    #   PodSourcePreparer.new(root_spec, root).prepare! if local?
    #   sandbox.remove_local_podspec(name) unless predownloaded? || local? || external?
    # end

    # def downloadWayForHttp(spec)
    #   # 获取podfile所有内容
    #   podfileContent = podfile.root_target_definitions.map(&:to_hash)
    #   dependencies = podfileContent[0]["children"][0]["dependencies"]
    #   sourceGit = spec.source[:git]
    #   $is_use_http = false #  默认没有使用http下载
    #   # 非http下载才替换
    #   unless sourceGit.nil?
    #     resetSourceForSpec(spec, sourceGit)
    #   end
    # end
  
    # def resetSourceForSpec(spec, sourceGit)
    #   # 判断github.com 和 git.huya.com
    #   # 默认git.huya.com
    #   tagValue = spec.source[:tag]
    #   branchValue = "master"
    #   # 取commit
    #   if tagValue.nil?
    #     tagValue = spec.source[:commit]
    #   end

    #   if tagValue.nil?
    #     tagValue = spec.source[:branch]
    #   end
    
    #   if spec.name == "react-native-community"
    #     puts "react-native-community"
    #   end

    #   if tagValue.class == String and !tagValue.empty?
    #       source = sourceGit.split('.git')[0] + "/-/archive/#{tagValue}/#{spec.name}-#{tagValue}.zip"
    #       if sourceGit.include?('github.com')
    #           #github
    #           source = sourceGit.split('.git')[0] + "/archive/refs/tags/#{tagValue}.zip"
    #           if spec.source[:branch].class == String and !spec.source[:branch].empty?
    #             source = sourceGit.split('.git')[0] + "/archive/refs/heads/#{tagValue}.zip"
    #           end
    #       end
    #   else
    #       source = sourceGit.split('.git')[0] + "/-/archive/#{branchValue}/#{spec.name}-#{branchValue}.zip"
    #       if sourceGit.include?('github.com')
    #           #github
    #           source = sourceGit.split('.git')[0] + "/archive/refs/heads/#{branchValue}.zip"
    #       end
    #   end
      
    #   $is_use_http = true
    #   spec.source = { :http => source}
      

    #   puts "spec.source end:==> #{spec.source}"
    # end


# http下载
module Pod
  class Installer
    class PodSourceInstaller
         # 修改spec的source值
      alias :origin_install! :install!
      def install!
        download_source unless predownloaded? || local?
         downloadWayForHttp(root_spec)
        PodSourcePreparer.new(root_spec, root).prepare! if local?
        sandbox.remove_local_podspec(name) unless predownloaded? || local? || external?
      end
  
      def downloadWayForHttp(spec)
        # 获取podfile所有内容
        podfileContent = podfile.root_target_definitions.map(&:to_hash)
        dependencies = podfileContent[0]["children"][0]["dependencies"]
        sourceGit = spec.source[:git]
        $is_use_http = false #  默认没有使用http下载
        # 非http下载才替换
        unless sourceGit.nil?
          resetSourceForSpec(spec, sourceGit)
        end
      end
    
      def resetSourceForSpec(spec, sourceGit)
        # 判断github.com 和 git.huya.com
        # 默认git.huya.com
        tagValue = spec.source[:tag]
        branchValue = "master"
        # 取commit
        if tagValue.nil?
          tagValue = spec.source[:commit]
        end
  
        if tagValue.nil?
          tagValue = spec.source[:branch]
        end
      
        if spec.name == "react-native-community"
          puts "react-native-community"
        end
  
        if tagValue.class == String and !tagValue.empty?
            source = sourceGit.split('.git')[0] + "/-/archive/#{tagValue}/#{spec.name}-#{tagValue}.zip"
            if sourceGit.include?('github.com')
                #github
                source = sourceGit.split('.git')[0] + "/archive/refs/tags/#{tagValue}.zip"
                if spec.source[:branch].class == String and !spec.source[:branch].empty?
                  source = sourceGit.split('.git')[0] + "/archive/refs/heads/#{tagValue}.zip"
                end
            end
        else
            source = sourceGit.split('.git')[0] + "/-/archive/#{branchValue}/#{spec.name}-#{branchValue}.zip"
            if sourceGit.include?('github.com')
                #github
                source = sourceGit.split('.git')[0] + "/archive/refs/heads/#{branchValue}.zip"
            end
        end
        
        $is_use_http = true
        spec.source = { :http => source}
        
  
        puts "spec.source end:==> #{spec.source}"
      end 
    end
  end
end





   