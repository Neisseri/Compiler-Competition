// error class for simplifing error handling
// using SyError().throw_error(MSG) to throw an error
#pragma once
#include <iostream>
#include <string>
#include <cstdlib>
#include "const.hpp"

static const bool DEBUG_PRINT = true;

class SyError
{
public:
    static void throw_error(ErrorTypeEnum type, std::string msg)
    {
        std::cerr << "Error: ";
        switch (type)
        {
        case ErrorTypeEnum::SemanticError:
            std::cerr << "SemanticError: ";
            break;
        case ErrorTypeEnum::SyntaxError:
            std::cerr << "SyntaxError: ";
            break;

        default:
            break;
        }
        std::cerr << msg << std::endl;
        exit(1);
    }
    static void throw_warning(std::string msg)
    {
        if(!DEBUG_PRINT) return;
        std::cerr << "Warning: ";
        std::cerr << msg << std::endl;
    }
    static void throw_unimplemented(std::string msg)
    {
        std::cerr << "Unimplemented: ";
        std::cerr << msg << std::endl;
        exit(1);
    }

    static void throw_info(std::string msg)
    {
        if (!DEBUG_PRINT)
            return;
        std::cerr << "Info: ";
        std::cerr << msg << std::endl;
    }
};