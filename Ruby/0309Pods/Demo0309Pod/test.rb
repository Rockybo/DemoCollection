# def hy_remove_pod_cache
#   specs = ["AFNetworking",
#            "Aspects",
#            "dwwupkit",
#            "FLEX",
#            "FMDB",
#            "hydeviceid",
#            "HYLiveSDK-kiwi",
#            "hymediatrans",
#            "HYMNN",
#            "HYMTPApi",
#            "hysdk",
#            "JRSwizzle",
#            "mobileapm",
#            "mtpencrypt",
#            "MTPNetService",
#            "MTPUtils",
#            "TYRZSDK",
#            "YYCache",
#            "YYImage",
#            "YYWebImage",
#            ]

#   specs.each do | spec_name |
#     puts "pod cache clean '#{spec_name}' --all"
#     system "pod cache clean '#{spec_name}' --all"
#   end
# end

# hy_remove_pod_cache()


def hy_remove_pod_cache
  specs = ["Folly","YYWebImage", "YYImage/WebP", "MTGLDebug"]
  specs.each do | spec_name |
    puts "pod cache clean '#{spec_name}' --all"
    system "pod cache clean '#{spec_name}' --all"
  end
end

hy_remove_pod_cache()
