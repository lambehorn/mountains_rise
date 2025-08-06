function fish_prompt
        set -l retc white
		test $status = 0; and set rect white

		set -q __fish_git_prompt_showupstream
		or set -g __fish_git_prompt_showupstream auto

		function _nim_prompt_wrapper
			set retc $argv[1]
			set -l field_name $argv[2]
			set -l field_value $argv[3]

			set_color normal
			set_color $retc
			echo -n '─'
			set_color -o $retc
			
			set_color normal
			test -n $field_name
			and echo -n $field_name:
			set_color $retc
			echo -n $field_value
		end

		set_color $retc
		echo -n '╭─'
		set_color -o white
		echo -n [
		set_color -o blue
		echo -n '   '  
		set_color -o white
		echo -n ]

		set_color -o white
		echo -n $USER
		set_color -o blue
		echo -n @

		set_color -o blue
		echo -n (prompt_hostname)
		set_color -o white
		echo -n : (prompt_pwd)
    
        # New line
        echo
    
        # Background jobs
        set_color normal
    
        for job in (jobs)
                set_color $retc
                echo -n '│ '
                set_color brown
                echo $job
        end
    
        set_color normal
        set_color $retc
        echo -n '╰─>'
        set_color -o blue
        echo -n '$ '
        set_color normal
end
