require 'fileutils'
require 'open3'
require 'json'
require 'set'

$pngs_name_results = []

# $aFile = File.new('input.txt','r+')

def merge_sub_bundle_to_main_bundle
	target_xcasstes_path = "./kiwi/Resource/Images.xcassets"

	all_component_folders = ['./hy_pods/ios-hycomponents_hyc/BaseBusiness',
                             './hy_pods/ios-hycomponents_hyc/LiveBase',
                             './hy_pods/ios-hycomponents_hyc/Modules',
                             ]

    query_xib_include_image(all_component_folders)

    puts "xib_name_set--->#{$xib_name_set}"

	all_component_folders.each do |component_folder|
		do_merge_sub_bundle_to_main_bundle(target_xcasstes_path, component_folder)
	end
end

def do_merge_sub_bundle_to_main_bundle(target_xcasstes_path, component_folder)
		Dir.foreach(component_folder) do |component_name|

			next if component_name == '.' or component_name == '..' or component_name == '.DS_Store'
			# 拼接路径 ./hy_pods/ios-hycomponents_hyc/LiveBase/HYLiveMedia
			component_path = File.join(component_folder, component_name)

			# 过滤包含PTY的资源
			next unless !component_name.include?("PTY")

			next unless Dir.exist?(component_path)



			Dir.glob("#{component_path}/**/*.xcassets").each do |xcassets_path|
				#./hy_pods/ios-hycomponents_hyc/LiveBase/HYLiveMedia/Resources/Images.xcassets
				next unless Dir.exist?(xcassets_path)
				is_common_res = xcassets_path.include?("#{component_name}/Resources/")
				is_kiwi_only_res = xcassets_path.include?("#{component_name}/Resources-kiwi/")
				next unless is_common_res or is_kiwi_only_res

				# 删除Contents.json文件
				del_file_path = File.join(xcassets_path, "Contents.json")
				File.delete(del_file_path) if File.exist?(del_file_path)

				# 获取*.imageset下的所有图片
				Dir.glob("#{xcassets_path}/**/*.imageset") do |image_file|
					# ./hy_pods/ios-hycomponents_hyc/LiveBase/HYLiveMedia/Resources/Images.xcassets/icon_vr_video_flag.imageset
					next unless File.directory?(image_file)

					# puts "image_file-->#{image_file}"
					# xcassets_path不能包含xib和storyboard图片
					image_file_name = image_file.split("/").last.split(".")[-2]
					# puts "image_file_name-->#{image_file_name}"
					isImage = false
					$xib_name_set.each do |xib_name|
						if image_file_name.include?(xib_name)
							puts "image_file_name-->#{image_file_name}"
					 		isImage = true
						end 
					end

					# 过滤xib和storyboard图片
					next unless !isImage

					#本地的真实路径/Users/libolin/Documents/RubyDemo/hy_pods/...../icon_vr_video_flag.imageset
					image_file_path = File.realpath(image_file)

					# /Resources/Images.xcassets/icon_vr_video_flag.imageset
					item_path_in_component = image_file.split(component_name).last

					# /Resources/Images/icon_vr_video_flag.imageset
					item_path_in_component = item_path_in_component.gsub(".xcassets", "")

					# 取目录：/Resources/Images
					item_path_in_target = File.dirname(item_path_in_component)

					# ./DemoRes/Resource/Images.xcassets/PTYMine/Resources/Images
					item_full_path = File.join(target_xcasstes_path, component_name, item_path_in_target)

#					 puts("moving to item_full_path:#{item_full_path}")
# 					puts("image_file_path✅:#{image_file_path}")
# 					$aFile.syswrite("image_file_path✅:#{image_file_path} \n")
					# 拼接路径
					dir_to_check = File.join(target_xcasstes_path, component_name, item_path_in_component)

					# 判断目标路径是否有图片资源，如果有 不移动资源，否则移动资源。
					unless $pngs_name_results.include?(image_file_name)
						$pngs_name_results.push(image_file_name)
						# 如果不存在item_full_path目录，创建item_full_path目录
						FileUtils.mkdir_p(item_full_path) unless Dir.exist?(item_full_path)

						# 如果已经存在，先移除当前路径
						FileUtils.rm_rf(dir_to_check) if Dir.exist?(dir_to_check)
						# 移动真实路径（image_file_path） 到 目标路径 （item_full_path）
						FileUtils.mv(image_file_path, item_full_path)
					else
						puts("assets重复图片:#{image_file_path}")
						puts("assets重复图片名字:#{image_file_name}")
						# $aFile.syswrite("assets重复图片:#{image_file_path} \n")
					end

				end
				# 移除原来路径的图片资源,判断原来目录是否是空目录
				FileUtils.rm_rf(xcassets_path) if Dir.empty?(xcassets_path)
			end
		end
end


$xib_name_set
def query_xib_include_image(all_component_folders)

	# puts "all_component_folders-->#{all_component_folders}"
	$xib_name_set = Set.new
	ipa_set = Set.new 

	all_component_folders.each do |component_forder|
		Dir.glob("#{component_forder}/**/*.xcassets") do | file_imageset |
			Dir.glob("#{file_imageset}/*").sort.each do | file |
				file_name = file.split("/").last.split(".")[-2]
				ipa_set.add file_name
			end
		end
	end

	all_component_folders.each do |component_forder|
		Dir.glob("#{component_forder}/**/*.xib").sort.each do | file_xib |
			next unless File.file? file_xib
			word_set = File.read(file_xib).scan(/\w+/).flatten.to_set
			word_set.each do | word |
				if ipa_set.include? word
					$xib_name_set.add word
				end
			end
		end

		Dir.glob("#{component_forder}/**/*.storyboard").sort.each do | file_storyboard |
			next unless File.file? file_storyboard

			word_set = File.read(file_storyboard).scan(/\w+/).flatten.to_set
			word_set.each do | word |
				if ipa_set.include? word
					$xib_name_set.add word
				end
			end
		end

	end
end

merge_sub_bundle_to_main_bundle()
