perl_build_for_android
======================

use perl script to build one android project.


-product/-p һ�״�������������Ŀ����Ŀ�����в�ͬ�����Ժͷֱ��ʡ�-p �����ظ��������ʽΪ��-p=��Ŀ��-locales���������ָ����-locales������Ĭ�ϴ����Դ��zh_CN,en_US,zh_TW,hdpi,ldpi,mdpi,nodpi,xhdpi,xxhdpi����
�磺
-p=a820 -p=a830 -p=a840
��һ�λ�����������Ŀ��apk��ͬʱ��ԴĬ�ϴ��Ϊ��zh_CN,en_US,zh_TW,hdpi,ldpi,mdpi,nodpi,xhdpi,xxhdpi��
-p=seine-zh_CN, xhdpi
��һ��ֻ����seineһ����Ŀ��ͬʱ��Դ�����Ϊ��zh_CN , xhdpi
 -simpleproduct/-sp  ��ʽΪ��-sp=��Ŀ��-locales�� �����ָ����-locales������Ĭ�ϴ����Դ��zh_CN,en_US,zh_TW,hdpi,ldpi,mdpi,nodpi,xhdpi,xxhdpi����
-p�ļ򻯰汾.-locales��ʹ��.
����
-sp=xx-cn,hdpi                                     ��ͬ��zh_CN,en_US,zh_TW,hdpi,ldpi,mdpi,nodpi
-sp=xx-cn,xhdpi                                   ��ͬ��zh_CN,en_US,zh_TW,xhdpi,ldpi,mdpi,nodpi
-sp=xx-cn,xxhdpi                                 ��ͬ��zh_CN,en_US,zh_TW,xxhdpi,ldpi,mdpi,nodpi
-sp=xx-oversea,hdpi                            ��ͬ��fulllan,hdpi,ldpi,mdpi,nodpi
-sp=xx-oversea,xhdpi                          ��ͬ��fulllanxhdpi,ldpi,mdpi,nodpi
-sp=xx-oversea,xhdpi                          ��ͬ��fulllan,xhdpi,ldpi,mdpi,nodpi
-sp=xx-cn                                             ��ͬ��zh_CN,en_US,zh_TW, xxhdpi,xhdpi,,hdpi,ldpi,mdpi,nodpi
-sp=xx-oversea                                    ��ͬ��fulllan, xxhdpi,xhdpi,,hdpi,ldpi,mdpi,nodpi
-sp=xx-hdpi                                          ��ͬ��cn,hdpi   
-sp=xx-xhdpi                                        ��ͬ��cn,xhdpi
-sp=xx-xxhdpi                                      ��ͬ��cn,xxhdpi
fulllan="en_US,fr_FR,it_IT,es_ES,de_DE,nl_NL,cs_CZ,pl_PL,ja_JP,zh_TW,zh_CN,ru_RU,ko_KR,nb_NO,es_US,da_DK,el_GR,tr_TR,pt_PT,pt_BR,rm_CH,sv_SE,bg_BG,ca_ES,en_GB,fi_FI,hi_IN,hr_HR,hu_HU,in_ID,iw_IL,lt_LT,lv_LV,ro_RO,sk_SK,sl_SI,sr_RS,uk_UA,vi_VN,tl_PH,ar_EG,fa_IR,th_TH,sw_TZ,ms_MY,af_ZA,zu_ZA,am_ET,hi_IN,vi";
���-sp��������������ƴ�������.
���õ�ʱ��ʹ��-sp=��Ŀ����-�ֱ���,����,nonet
ʾ��:
./buildapp �Csp=All-hdpi,oversea,nonet  ��������all�汾,hdpi�ֱ���,����ȫ���԰�,��������汾.
nonetĬ��ȥ�޸�config�е�{��network������0��}
�粻����������assets/config {��network������0��}
Ĭ��ֵΪ1.

 -autobuild/-a ���ر���ʹ�ã��Ƿ񱾵ز��ýű�ģ��autobuild���� true/false  autobuild������Ĭ��true,����Ĭ��false
 -debug/-d �Ƿ�򿪴�ӡ��Ϣ true/false Ĭ��false
 -key/-k ���ر���ʹ�ã�ǩ��key����,Key type: platform releasekey media shared
 -name/-n Ӧ�ó�������
 -sdk/-s android-sdk�汾 Ĭ��ʹ��14
-suffix/-sf �Ƿ���ʾ������������Ŀ����,true/false Ĭ��true
����ر�������framework����ģ���ע������Ӧ���Լ���framework���ơ��밴���·�ʽ���ýű���framework�����Ʋ���Ҫ��jar��׺��
 -framework_name/-fn framework����Ĭ��ֵframework-classes
 -sec_framework_name/-sfn �ڶ���framework����Ĭ��ֵsec-framework-classes
����ű�����Ĭ��ֵ��ȥ�����������⣬����������һ�£�����Ҫ����������������������Ҫ���Ӳ�����ָ��Ӧ�õ�framework���ơ�



�������˽ű��Ѿ�������overlay AndroidManifest.xml����.
 
�����÷�����:
1.Դ���Ŀ¼����overlay�ļ���
2. ��Ҫ��Ӧ���ӽű�����-p�е���Ŀ����.Ʃ��-p=all
��ô����overlay/all/AndroidManifest.xml �����ʱ��ͻ��Զ�overlay���xml.
 
���÷�����׶�����:
������ά��2��AndroidManifest.xml,�������ά������ʱ,���ֵ�activity�Ҳ��������������н��.