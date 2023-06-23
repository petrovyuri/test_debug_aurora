/*
 * Copyright (c) 2023. Open Mobile Platform LLC.
 * License: Proprietary.
 */
#ifndef FLUTTER_PLUGIN_SQFLITE_UTILS_H
#define FLUTTER_PLUGIN_SQFLITE_UTILS_H

#include <optional>
#include <string>

namespace utils {

class error final
{
public:
    explicit error(std::string message);
    error() = default;

    explicit operator bool() const;
    const std::string &message() const;

    static error none();

private:
    std::optional<std::string> m_message;
};

} /* namespace utils */

#endif /* FLUTTER_PLUGIN_SQFLITE_UTILS_H */
