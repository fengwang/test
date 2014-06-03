test
====

A simple unit testing framework in C++11

example:
==

    //TEST -- std::cout
    auto test = numeric::make_test();

    test.assert( []{ return 1 == 1; } );
    test.assert( []{ return 0 == 1; } );

    test.assert( "should work", []{ return 1 == 1; } );
    test.assert( "should not work", []{ return 0 == 1; } );

    test.assert( "should work", []{ return 1 == 1; }, [](bool ans){ if (ans) std::cout << "works--.\n"; else std::cout << "not work--.\n";} );
    test.assert( "should not work", []{ return 1 == 0; }, [](bool ans){ if (!ans) std::cout << "not works--.\n"; else std::cout << "work--.\n";} );

    //TEST -- std::cerr
    auto new_test = numeric::make_test(std::cerr, "Cerr test");

    new_test.assert( []{ return 1 == 1; } );
    new_test.assert( []{ return 0 == 1; } );

    new_test.assert( "should work", []{ return 1 == 1; } );
    new_test.assert( "should not work", []{ return 0 == 1; } );

    new_test.assert( "should work", []{ return 1 == 1; }, [](bool ans){ if (ans) std::cout << "works--.\n"; else std::cout << "not work--.\n";} );
    new_test.assert( "should not work", []{ return 1 == 0; }, [](bool ans){ if (!ans) std::cout << "not works--.\n"; else std::cout << "work--.\n";} );

    //TEST -- file
    std::ofstream ofs( "log.txt" );
    auto log_test = numeric::make_test( ofs, "File test" );

    log_test.assert( []{ return 1 == 1; } );
    log_test.assert( []{ return 0 == 1; } );

    log_test.assert( "should work", []{ return 1 == 1; } );
    log_test.assert( "should not work", []{ return 0 == 1; } );

    log_test.assert( "should work", []{ return 1 == 1; }, [](bool ans){ if (ans) std::cout << "works--.\n"; else std::cout << "not work--.\n";} );
    log_test.assert( "should not work", []{ return 1 == 0; }, [](bool ans){ if (!ans) std::cout << "not works--.\n"; else std::cout << "work--.\n";} );


notes:
==
        g++(4.7-4.9) lacks of basic_stringstream move constructor(http://gcc.gnu.org/bugzilla/show_bug.cgi?id=53626), so only clang++ works with this lib.


