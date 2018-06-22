class Listing < ApplicationRecord
	belongs_to :user


	self.per_page = 6

	# attr_accessor :cover

	# after_save :save_cover_image, if: :cover

	# def save_cover_image
	# 	filename = cover.original_filename

	# 	folder = "public/images/#{id}/cover"

	# 	FileUtils::mkdir_p folder

	# 	f =File.open File.join(folder, filename), "wb"

	# 	f.write cover.read()
	# 	f.close

	# 	self.cover = nil
	# 	update cover_filename: filename

	# end

	 mount_uploader :cover, CoverUploader

	# mount_uploader :photo, ImageUploader

	# before_save :update_photo_attributes

	# private

	# def update_photo_attributes
	# 	if photo.present? && photo_ahnged?
	# 		self.photo_content_type = photo.file.content_type
	# 		self.photo_file_size = photo.file.size
	# 	end
	# end

end

