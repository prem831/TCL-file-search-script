#global yyo [open "ok3.txt" w+]
global i
set i 0
#-----------------------------------------------------------------------------to know how many times that the substring repeated in the given string 
proc ssc {str ch} {
	regexp -all ***=$ch $str
}
#-----------------------------------------------------------------------------
proc fs { dir path } {
	set pw [pwd]
	#----------------------------
	if [catch {cd $dir} err] {
		puts stderr $err
		return
	}
	#----------------------------
	set u [llength [glob -nocomplain $path] ]
	set j 0
	foreach f [glob -nocomplain $path] {
		incr j
		set a [ssc $dir "/"]
		set fq [expr $a+1]
		set g [string repeat "|      " $a]
		set z [string repeat "|      " $fq]
		if {$j!=$u} {
		puts stdout "$g|\n$g|--- $f"
	} else {
		puts stdout "$g|\n$g,--- $f"		
}
	}
	
#-----------------------------------------------------
	foreach fl [glob -nocomplain *] {
						
		if [file isdirectory $fl] {
			puts -nonewline stdout "$z\n$g|----$fl\n"			
			fs $dir/$fl $path
		}
	}
#------------------------------------------------------
cd $pw
}

set pp [file normalize *]
set rr [string trim $pp "/*" ]
set qq "/${rr}"
set s [fs $qq *]
#set s [fs /home *]
puts $s

#close $yyo
#puts $s
#set yyo [open "ok3.txt" w]
#puts -nonewline $yyo $s
#close $yyo
