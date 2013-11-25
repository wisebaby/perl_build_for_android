#!/usr/bin/perl
###################################################
#author:wangxuejin
#time:2012-11-29
#Purpose:create for auto upload to git.
#2012-11-29,generate fisrt version.
#./auto_upload_to_app.pl -b=adana_dev -gp=sma:platform/vendor/lenovo/app -ap=apps/IdeaFriend/apps -cl=xxx111 -an=ideaFriend -oan=1 -r=wangxjn@lenovo.com
###################################################
use strict;
use warnings;

my @branch_list;
my $defaultBranch="master";
my $git_path;
my $apk_path;
my $change_log;
my $apk_name;
my $oring_apk_name;
my $reviewer;
my $app_suffix="app";
&handle_cmdOption();

foreach (@branch_list){
my $branch=$_;
qx (rm -rf $app_suffix);
qx(git clone $git_path -b$branch);

my $full_app_path="$app_suffix/$apk_path/$apk_name.apk";
my $cmd="cp $oring_apk_name.apk $full_app_path -rf";
#print $cmd;
qx($cmd);

qx(cd $app_suffix;git add $apk_path/$apk_name.apk);

qx(cd $app_suffix;git commit -m"$change_log");

my $push_cmd="git push --receive-pack='git receive-pack --reviewer=$reviewer' origin HEAD:refs/for/$branch";
print $push_cmd;
qx(cd $app_suffix;$push_cmd);
}

sub handle_cmdOption(){
	foreach (@ARGV)
	{
		if ($_=~/-branch\s*=\s*(\S*)/ || $_=~/-b\s*=\s*(\S*)/){
			push(@branch_list,$1);
		}
		elsif($_=~/-gitpatch\s*=\s*(\S*)/ || $_=~/-gp\s*=\s*(\S*)/){
			$git_path=$1;
		}
		elsif($_=~/-apkpath\s*=\s*(\S*)/ || $_=~/-ap\s*=\s*(\S*)/){
			$apk_path = $1;			
		}
		elsif($_=~/-changelog\s*=\s*(\S*)/ || $_=~/-cl\s*=\s*(\S*)/){
			$change_log = $1;			
		}
		elsif($_=~/-apkname\s*=\s*(\S*)/ || $_=~/-an\s*=\s*(\S*)/){
			$apk_name = $1;	
		}
		elsif($_=~/-orginapkname\s*=\s*(\S*)/ || $_=~/-oan\s*=\s*(\S*)/){
			$oring_apk_name = $1;
		}elsif($_=~/-reviewer\s*=\s*(\S*)/ || $_=~/-r\s*=\s*(\S*)/){
			$reviewer = $1;
		}
	}
	if (@branch_list == 0){
		push(@branch_list,$defaultBranch);
	}
}
