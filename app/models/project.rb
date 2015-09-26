class Project < ActiveRecord::Base
	has_many :tasks
	validates :title,
	presence: { message: "入力してください"}, #validationでtitleがnilの場合拒否する
	length: { minimum: 3, message: "短けぇぞコラァ！"}
end
