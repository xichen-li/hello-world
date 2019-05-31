#!/bin/sh
hello world
111111111111
file="/ac/etc/config/contchk/contchkprivate.inf"
section="2987252144"
item="RuleID"
val="2"

# $1:文件名 $2:标识字符串 $3:$2后面修改的第一个key  $4:修改后的值(无双引号)
writeIni() {
    file=$1;section=$2;item=$3;val=$4
	line_pre=`cat $file | wc -l`
    #awk -F '=' '/\['${section}'\]/{a=1} (a==1 && "'${item}'"==$1){gsub($2,"\"'${val}'\"");a=0} {print $0}' ${file} 1<>${file}
    awk -F ' = ' '/'${section}'/{a=1} (a==1 && "'${item}'"==$1){gsub($2,"'${val}'");a=0} {print $0}' ${file} 1<>${file}
	line_end=`cat $file | wc -l`
	line_del=`expr $line_pre + 1`

	sed "$line_del,${line_end}d" ${file} > /tmp/test.inf
	mv /tmp/test.inf ${file}
}

writeIni ${file} ${section} ${item} ${val}
# cat uniid.txt | while read line
# do
 #   echo $line
	# writeIni ${file} ${line} ${item} ${val}
# done

#!/bin/sh

file="/ac/etc/config/contchk/contchkprivate.inf"
section="2987252144"
item="RuleID"
val="2"

# $1:文件名 $2:标识字符串 $3:$2后面修改的第一个key  $4:修改后的值(无双引号)
writeIni() {
    file=$1;section=$2;item=$3;val=$4
	line_pre=`cat $file | wc -l`
    #awk -F '=' '/\['${section}'\]/{a=1} (a==1 && "'${item}'"==$1){gsub($2,"\"'${val}'\"");a=0} {print $0}' ${file} 1<>${file}
    awk -F ' = ' '/'${section}'/{a=1} (a==1 && "'${item}'"==$1){gsub($2,"'${val}'");a=0} {print $0}' ${file} 1<>${file}
	line_end=`cat $file | wc -l`
	line_del=`expr $line_pre + 1`

	sed "$line_del,${line_end}d" ${file} > /tmp/test.inf
	mv /tmp/test.inf ${file}
}

writeIni ${file} ${section} ${item} ${val}
# cat uniid.txt | while read line
# do
 #   echo $line
	# writeIni ${file} ${line} ${item} ${val}
# done

