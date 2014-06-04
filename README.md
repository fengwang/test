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

Output:

    works--.
    not works--.
    works--.
    not works--.
    works--.
    not works--.
    Details for Test --[[Cerr test]]--
    1:
    2:              should work
    3:              should work

                    ---- Success Cases: 3

    Details for Test --[[Cerr test]]--
    1:
    2:              should not work
    3:              should not work

                    ---- Failure Cases: 3

    Details for Test --[[default]]--
    1:
    2:              should work
    3:              should work

                    ---- Success Cases: 3

    Details for Test --[[default]]--
    1:
    2:              should not work
    3:              should not work

                    ---- Failure Cases: 3

File log.txt:

    Details for Test --[[File test]]--
    1:
    2:              should work
    3:              should work

                    ---- Success Cases: 3

    Details for Test --[[File test]]--
    1:
    2:              should not work
    3:              should not work

                    ---- Failure Cases: 3


notes:
==
g++(4.7-4.9) lacks of basic_stringstream move constructor(http://gcc.gnu.org/bugzilla/show_bug.cgi?id=53626), so only clang++ works with this lib.


