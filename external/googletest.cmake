include(ExternalProject)

set(googletest_INCLUDE_DIRS ${CMAKE_CURRENT_BINARY_DIR}/googletest/src/googletest/googletest/include)
set(googletest_URL https://github.com/google/googletest.git)
set(googletest_BUILD ${CMAKE_CURRENT_BINARY_DIR}/googletest)
set(googletest_TAG ec44c6c1675c25b9827aacd08c02433cccde7780)

if (WIN32)
  if (${CMAKE_GENERATOR} MATCHES "Visual Studio.*")
    set(googletest_STATIC_LIBRARIES
        ${CMAKE_CURRENT_BINARY_DIR}/googletest/src/googletest/googletest/$(Configuration)/libgtest.lib
        ${CMAKE_CURRENT_BINARY_DIR}/googletest/src/googletest/googletest/$(Configuration)/libgtest_main.lib)
  else()
    set(googletest_STATIC_LIBRARIES
        ${CMAKE_CURRENT_BINARY_DIR}/googletest/src/googletest/googletest/libgtest.lib
        ${CMAKE_CURRENT_BINARY_DIR}/googletest/src/googletest/googletest/libgtest_main.lib)
  endif()
else()
  set(googletest_STATIC_LIBRARIES
      ${CMAKE_CURRENT_BINARY_DIR}/googletest/src/googletest/googletest/${CMAKE_BUILD_TYPE}/libgtest.a
      ${CMAKE_CURRENT_BINARY_DIR}/googletest/src/googletest/googletest/${CMAKE_BUILD_TYPE}/libgtest_main.a)
  endif()

ExternalProject_Add(googletest
    PREFIX googletest
    GIT_REPOSITORY ${googletest_URL}
    GIT_TAG ${googletest_TAG}
    DOWNLOAD_DIR "${DOWNLOAD_LOCATION}"
    BUILD_IN_SOURCE 1
    BUILD_BYPRODUCTS ${googletest_STATIC_LIBRARIES}
    INSTALL_COMMAND ""
    CMAKE_CACHE_ARGS
        -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
        -DBUILD_GMOCK:BOOL=OFF
        -DBUILD_GTEST:BOOL=ON
        -Dgtest_force_shared_crt:BOOL=ON)