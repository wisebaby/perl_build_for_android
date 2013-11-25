perl_build_for_android
======================

use perl script to build one android project.


-product/-p 一套代码编译出几个项目，项目可以有不同的语言和分辨率。-p 可以重复多个。形式为“-p=项目名-locales”，如果不指定“-locales”，则默认打包资源“zh_CN,en_US,zh_TW,hdpi,ldpi,mdpi,nodpi,xhdpi,xxhdpi”。
如：
-p=a820 -p=a830 -p=a840
则一次会编译出三个项目的apk，同时资源默认打包为：zh_CN,en_US,zh_TW,hdpi,ldpi,mdpi,nodpi,xhdpi,xxhdpi。
-p=seine-zh_CN, xhdpi
则一次只编译seine一个项目，同时资源仅打包为：zh_CN , xhdpi
 -simpleproduct/-sp  形式为“-sp=项目名-locales” 如果不指定“-locales”，则默认打包资源“zh_CN,en_US,zh_TW,hdpi,ldpi,mdpi,nodpi,xhdpi,xxhdpi”。
-p的简化版本.-locales简化使用.
增加
-sp=xx-cn,hdpi                                     等同于zh_CN,en_US,zh_TW,hdpi,ldpi,mdpi,nodpi
-sp=xx-cn,xhdpi                                   等同于zh_CN,en_US,zh_TW,xhdpi,ldpi,mdpi,nodpi
-sp=xx-cn,xxhdpi                                 等同于zh_CN,en_US,zh_TW,xxhdpi,ldpi,mdpi,nodpi
-sp=xx-oversea,hdpi                            等同于fulllan,hdpi,ldpi,mdpi,nodpi
-sp=xx-oversea,xhdpi                          等同于fulllanxhdpi,ldpi,mdpi,nodpi
-sp=xx-oversea,xhdpi                          等同于fulllan,xhdpi,ldpi,mdpi,nodpi
-sp=xx-cn                                             等同于zh_CN,en_US,zh_TW, xxhdpi,xhdpi,,hdpi,ldpi,mdpi,nodpi
-sp=xx-oversea                                    等同于fulllan, xxhdpi,xhdpi,,hdpi,ldpi,mdpi,nodpi
-sp=xx-hdpi                                          等同于cn,hdpi   
-sp=xx-xhdpi                                        等同于cn,xhdpi
-sp=xx-xxhdpi                                      等同于cn,xxhdpi
fulllan="en_US,fr_FR,it_IT,es_ES,de_DE,nl_NL,cs_CZ,pl_PL,ja_JP,zh_TW,zh_CN,ru_RU,ko_KR,nb_NO,es_US,da_DK,el_GR,tr_TR,pt_PT,pt_BR,rm_CH,sv_SE,bg_BG,ca_ES,en_GB,fi_FI,hi_IN,hr_HR,hu_HU,in_ID,iw_IL,lt_LT,lv_LV,ro_RO,sk_SK,sl_SI,sr_RS,uk_UA,vi_VN,tl_PH,ar_EG,fa_IR,th_TH,sw_TZ,ms_MY,af_ZA,zu_ZA,am_ET,hi_IN,vi";
针对-sp新增屏蔽网络控制串的生成.
配置的时候使用-sp=项目名称-分辨率,语言,nonet
示范:
./buildapp –sp=All-hdpi,oversea,nonet  就是配置all版本,hdpi分辨率,海外全语言包,屏蔽网络版本.
nonet默认去修改config中的{“network”：”0”}
如不存在则增加assets/config {“network”：”0”}
默认值为1.

 -autobuild/-a 本地编译使用；是否本地采用脚本模拟autobuild编译 true/false  autobuild服务器默认true,本地默认false
 -debug/-d 是否打开打印信息 true/false 默认false
 -key/-k 本地编译使用；签名key类型,Key type: platform releasekey media shared
 -name/-n 应用程序名称
 -sdk/-s android-sdk版本 默认使用14
-suffix/-sf 是否显示渠道名或者项目名称,true/false 默认true
如果特别依赖于framework编译的，请注意配置应用自己的framework名称。请按以下方式配置脚本，framework的名称不需要带jar后缀。
 -framework_name/-fn framework名字默认值framework-classes
 -sec_framework_name/-sfn 第二个framework名称默认值sec-framework-classes
编译脚本会以默认值名去查找这两个库，如果库的名称一致，则不需要设置这两个参数。否则需要增加参数，指定应用的framework名称。



服务器端脚本已经增加了overlay AndroidManifest.xml功能.
 
具体用法如下:
1.源码根目录增加overlay文件夹
2. 需要对应增加脚本参数-p中的项目名称.譬如-p=all
那么增加overlay/all/AndroidManifest.xml 编译的时候就会自动overlay这个xml.
 
该用法问题弊端提醒:
请自行维护2套AndroidManifest.xml,如果出现维护不及时,出现的activity找不到等问题请自行解决.