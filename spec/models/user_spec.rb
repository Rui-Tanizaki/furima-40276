require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameが入力されている' do
        @user.valid?
        expect(@user.errors[:nickname]).to_not include("can't be blank")
      end
      it 'emailが入力されている' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Email can't be blank"
      end 
      it 'emailは重複したemailが存在していない' do
        @user.email = "newtest12345@email.com"
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Email has already been taken"
      end
      it 'passwordが空ではない' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Password can't be blank"
      end  
      it 'passwordが6文字以上入力されている' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Password is too short (minimum is 6 characters)"
      end  
      it 'passwordには英字・数字が両方含まれている' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Password is invalid. Include both letters and numbers"
      end 
      it 'passwordとpassword_confirmationが一致している' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Password confirmation doesn't match Password"
      end
      it 'name_first_kanjiが空ではない' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Name first kanji can't be blank"
      end 
      it 'name_first_kanjiには全角漢字が入力されている' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Name first kanji is invalid. Input full-width characters"
      end
      it 'name_first_kanaが空ではない' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Name first kana can't be blank"
      end
      it 'name_first_kanaには全角カタカナが入力されている' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Name first kana is invalid. Input full-width katakana characters"
      end
      it 'birth_dateが空ではない' do
        @user.valid?
        expect(@user.errors.full_messages).to_not include "Birth date can't be blank"
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "test12345"
        @user.password_confirmation = "test1234"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合は登録できない' do
        existing_user = FactoryBot.create(:user, email: "test@email.com")
        @user.email = "test@email.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordには英字・数字両方が含まれていないと登録出来ない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it 'passwordには英字・数字両方が含まれていないと登録出来ない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it 'name_first_kanjiが空では登録出来ない' do
        @user.name_first_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first kanji can't be blank"
      end
      it 'name_first_kanjiには全角漢字でない場合は登録出来ない' do
        @user.name_first_kanji = "ヤマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first kanji is invalid. Input full-width characters"
      end
      it 'name_first_kanjiには全角漢字でない場合は登録出来ない' do
        @user.name_first_kanji = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first kanji is invalid. Input full-width characters"
      end
      it 'name_first_kanjiには全角漢字でない場合は登録出来ない' do
        @user.name_first_kanji = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first kanji is invalid. Input full-width characters"
      end
      it 'name_first_kanaが空では登録出来ない' do
        @user.name_first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first kana can't be blank"
      end
      it 'name_first_kanaにはカタカナでない場合は登録出来ない' do
        @user.name_first_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first kana is invalid. Input full-width katakana characters"
      end
      it 'name_first_kanaにはカタカナでない場合は登録出来ない' do
        @user.name_first_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first kana is invalid. Input full-width katakana characters"
      end
      it 'name_first_kanaにはカタカナでない場合は登録出来ない' do
        @user.name_first_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name first kana is invalid. Input full-width katakana characters"
      end
      it 'name_last_kanjiが空では登録出来ない' do
        @user.name_last_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last kanji can't be blank"
      end
      it 'name_last_kanjiには全角漢字でない場合は登録出来ない' do
        @user.name_last_kanji = "ヤマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last kanji is invalid. Input full-width characters"
      end
      it 'name_last_kanjiには全角漢字でない場合は登録出来ない' do
        @user.name_last_kanji = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last kanji is invalid. Input full-width characters"
      end
      it 'name_last_kanjiには全角漢字でない場合は登録出来ない' do
        @user.name_last_kanji = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last kanji is invalid. Input full-width characters"
      end
      it 'name_last_kanaが空では登録出来ない' do
        @user.name_last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last kana can't be blank"
      end
      it 'name_last_kanaには全角カタカナでない場合は登録出来ない' do
        @user.name_last_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last kana is invalid. Input full-width katakana characters"
      end
      it 'name_last_kanaには全角カタカナでない場合は登録出来ない' do
        @user.name_last_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last kana is invalid. Input full-width katakana characters"
      end
      it 'name_last_kanaには全角カタカナでない場合は登録出来ない' do
        @user.name_last_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name last kana is invalid. Input full-width katakana characters"
      end
      it 'birth_dateが空では登録出来ない' do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end