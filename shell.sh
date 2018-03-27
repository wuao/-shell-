#!/bin/bash
#--------------------------------------------
#
# 打包压缩当前目录下所有网站目录到根据时间来创建zip
# 所有打包后的zip文件将保存到当前目录目录下，
# 重复打包只会存在最新包 不会产生新包
# 并且将打包记录及结果存入logPath日志文件中
# 
#--------------------------------------------
date=$(date "+%Y%m%d")
date2=$(date "+%Y年%m月%d日%H时%M分%S秒")
logPath="/Users/wuao/gradle/filezip.log"

for i in $(ls)
do
    if [ -d $i ]
    then
        zip -r "${i}".zip ide
        if [ $? -eq 0 ]
        then
            echo -e "文件夹 $i 于 ${date2} 打包压缩成功\n" >>${logPath}
        else
            echo -e "文件夹 $i 于 ${$date2} 打包压缩失败\n" >> ${logPath}
        fi
    fi
done