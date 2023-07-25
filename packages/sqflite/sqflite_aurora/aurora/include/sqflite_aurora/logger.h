/*
 * Copyright (C) 2023 Open Mobile Platform LLC.
 */
#ifndef FLUTTER_PLUGIN_SQFLITE_LOGGER_H
#define FLUTTER_PLUGIN_SQFLITE_LOGGER_H

#include <flutter/logger.h>
#include <sqflite_aurora/globals.h>
#include <string>

class PLUGIN_EXPORT Logger final
{
public:
    enum Level {
        None = 0,
        Sql,
        Verbose,
    };

public:
    Logger(Level level, const std::string &tag);

    Level logLevel() const;
    void setLogLevel(Level level);

    std::string tag() const;
    void setTag(const std::string &tag);

    std::ostream &verb();
    std::ostream &sql();

private:
    Level m_level;
    std::string m_tag;
    std::ostream m_devnull;
};

#endif /* FLUTTER_PLUGIN_SQFLITE_LOGGER_H */