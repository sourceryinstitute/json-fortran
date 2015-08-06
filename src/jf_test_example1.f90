    program example1

        use json_module

        type(json_file) :: json
        logical :: found
        integer :: i,j,k

        ! initialize the module
        call json_initialize()

        ! read the file
        call json%load_file(filename = '../files/inputs/test1.json')

        ! print the file to the console
        call json%print_file()

        ! extract data from the file
        ! [found can be used to check if the data was really there]
        call json%get('version.major', i, found)
        if ( .not. found ) stop 1
        call json%get('version.minor', j, found)
        if ( .not. found ) stop 1
        call json%get('data(1).number', k, found)
        if ( .not. found ) stop 1

        ! clean up
        call json%destroy()
        if (json_failed()) stop 1

    end program example1
