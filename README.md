
AniTalker的一个CPU封装
用于小组作业
原github项目：https://github.com/X-LANCE/AniTalker


在master分支下下载所需文件，另需ckpts文件夹下的文件，根据原github项目，可以参考如下下载：
[中文用户] For Chinese users, we recommend you visit [here](https://pan.baidu.com/s/1gqTPmoJ3QwKbGkqgMXM3Jw?pwd=antk) to download.

```
ckpts/
├── chinese-hubert-large
├──── config.json
├──── preprocessor_config.json
├──── pytorch_model.bin
├── stage1.ckpt
├── stage2_pose_only_mfcc.ckpt
├── stage2_full_control_mfcc.ckpt
├── stage2_audio_only_hubert.ckpt
├── stage2_pose_only_hubert.ckpt
└── stage2_full_control_hubert.ckpt
```

1.运行Dockerfile构建镜像

2.运行类似以下语句进行测试（注意将路径进行修改）：
  docker run --rm -v F:/AniTalker/AniTalker-main/test_demos/portraits/girl.png:/app/girl.png -v F:/AniTalker/AniTalker-main/test_demos/audios/speech4.wav:/app/speech4.wav -v F:/AniTalker/AniTalker- main/run_output:/app/run_output anitalker:v1 --input_image /app/girl.png --input_audio_text /app/speech4.wav --output_dir /app/run_output
  
  以上运行语句的模板如下：
  docker run --rm \
-v /path/to/your/input_image:/app/input_image \
-v /path/to/your/input_audio_text:/app/input_audio_text \
-v /path/to/your/output_dir:/app/output_dir \
your_docker_image_name \
--input_image /app/input_image \
--input_audio_text /app/input_audio_text \
--output_dir /app/output_dir
