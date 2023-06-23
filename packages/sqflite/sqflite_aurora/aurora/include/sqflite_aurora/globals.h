/*
 * Copyright (c) 2023. Open Mobile Platform LLC.
 * License: Proprietary.
 */
#ifndef FLUTTER_PLUGIN_SQFLITE_GLOBALS_H
#define FLUTTER_PLUGIN_SQFLITE_GLOBALS_H

#ifdef PLUGIN_IMPL
#define PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define PLUGIN_EXPORT
#endif

#endif /* FLUTTER_PLUGIN_SQFLITE_GLOBALS_H */
