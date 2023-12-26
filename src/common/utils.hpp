#pragma once
#include <iostream>
#include <fstream>
#include <filesystem>
#include <string>

namespace fs = std::filesystem;

std::ofstream openOrCreateFile(const std::string &file_path, const std::string &file_name)
{
    // Combine directory and file name to get the full output path
    std::string full_file_path = file_path + "/" + file_name + ".s";

    // Check if the directory exists, create it if not
    if (!fs::exists(file_path))
    {
        fs::create_directories(file_path);
    }

    // Open the output file
    std::ofstream output_file(full_file_path);

    if (!output_file.is_open())
    {
        std::cerr << "Error: Unable to open file " << full_file_path << std::endl;
        // You might want to handle the error accordingly, e.g., throw an exception
    }

    return output_file;
}