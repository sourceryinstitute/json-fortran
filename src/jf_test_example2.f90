    program example2

        use,intrinsic :: iso_fortran_env, only: wp => real64

        use json_module

        type(json_value),pointer :: p, inp

        ! initialize the module
        call json_initialize()

        ! initialize the structure:
        call json_create_object(p,'')

        ! add an "inputs" object to the structure:
        call json_create_object(inp,'inputs')
        call json_add(p, inp) !add it to the root

        ! add some data to inputs:
        call json_add(inp, 't0', 0.1_wp)
        call json_add(inp, 'tf', 1.1_wp)
        call json_add(inp, 'x0', 9999.0000d0)
        call json_add(inp, 'integer_scalar', 787)
        call json_add(inp, 'integer_array', [2,4,99])
        call json_add(inp, 'names', ['aaa','bbb','ccc'])
        call json_add(inp, 'logical_scalar', .true.)
        call json_add(inp, 'logical_vector', [.true., .false., .true.])
        nullify(inp)  !don't need this anymore

        ! write the file:
        call json_print(p,'../files/example2.json')

        !cleanup:
        call json_destroy(p)
        if (json_failed()) stop 1

    end program example2
