# - Modify compile flags to use the static runtimes of MSVC
#
#  include(MSVCStaticRuntime)
#
# Requires these CMake modules:
#  ListCombinations.cmake
#
# Original Author:
# 2009-2010 Ryan Pavlik <rpavlik@iastate.edu> <abiryan@ryand.net>
# http://academic.cleardefinition.com
# Iowa State University HCI Graduate Program/VRAC

if(MSVC)
	string(TOUPPER "${CMAKE_CONFIGURATION_TYPES}" _conftypesUC)
	include(ListCombinations)
	list_combinations(_varnames
		PREFIXES
		CMAKE_C_FLAGS_
		CMAKE_CXX_FLAGS_
		SUFFIXES
		${_conftypesUC})
	foreach(_var ${_varnames})
		string(REPLACE "/MDd" "/MTd" ${_var} "${${_var}}")
		string(REPLACE "/MD" "/MT" ${_var} "${${_var}}")
	endforeach()
endif()

set(Boost_USE_STATIC_LIBS ON)
