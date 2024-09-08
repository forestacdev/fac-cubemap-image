#!/bin/bash

# 現在のディレクトリ内のすべての.JPGファイルに対してループ
for input_file in *.JPG
do
    # ファイルが実際に存在することを確認
    if [ -f "$input_file" ]; then
        # ファイル名（拡張子なし）を取得
        filename=$(basename "$input_file")
        filename_noext="${filename%.*}"

        # 出力ディレクトリを作成
        output_dir="$filename_noext"
        mkdir -p "$output_dir"

        # FFmpegコマンドを実行
        ffmpeg -i "$input_file" -vf "v360=e:c6x1,untile=6x1" "$output_dir/face_%d.jpg"

        echo "キューブマップテクスチャが $output_dir に生成されました。"
    fi
done

echo "すべての.JPGファイルの処理が完了しました。"