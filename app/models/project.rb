class Project < ActiveRecord::Base
	validates :title,
	presence: { message: "入力してください"}, #validationでtitleがnilの場合拒否する
	length: { minimum: 3, message: "短けぇぞコラァ！"}
end
