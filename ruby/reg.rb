# 当たりを定義する（この時、関数名の最初に$をつける。理由については「ruby 関数 スコープ」でググってみるといいかも）
$hit = "レジギガス"

# 「レジギガス」の文字列を一文字ずつ分解して配列にぶち込む
array = ["レ", "ジ", "ギ", "ガ", "ス"]

# ガチャの回数を計測するための関数
num = 0

# ループ関数（ここから）
loop do
    # "レジギガス"の文字をシャッフル
    word = array.shuffle

    # 配列のままでは扱いづらいので文字列化する
    word = word.join("")
    
    # ガチャ回数を+1する
    num += 1

    # もしシャッフルした文字列が「レジギガス」だった場合
    if word == $hit then

        # ガチャ回数とかいろいろ表示させる
        puts "ガチャ#{num}回目: #{word}"
        puts "ヒット！ (ガチャ#{num}回目)"
        
        # 無限ループから抜けるためにbreakを使う（これがないと当たりが出てもガチャが続いてしまう）
        break
    
    # シャッフルした文字が「レジギガス」ではなかった場合
    else

        # ガチャ回数とシャッフルした文字列を表示させる
        puts "ガチャ#{num}回目: #{word}"
    
    # ifを閉じる
    end

# ループを閉じる
end