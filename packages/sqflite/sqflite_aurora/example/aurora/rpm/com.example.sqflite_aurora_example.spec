%global __provides_exclude_from ^%{_datadir}/%{name}/lib/.*$
%global __requires_exclude ^lib(dconf|flutter-embedder|maliit-glib|appmanifest-.+|.+_platform_plugin)\\.so.*$

Name: com.example.sqflite_aurora_example
Summary: Demonstrates how to use the sqflite_aurora plugin.
Version: 0.1.0
Release: 1
License: Proprietary
Source0: %{name}-%{version}.tar.zst

BuildRequires: cmake
BuildRequires: pkgconfig(sqlite3)
BuildRequires: pkgconfig(flutter-embedder)

%description
%{summary}.

%prep
%autosetup

%build
%cmake -DCMAKE_BUILD_TYPE=%{_flutter_build_type}
%make_build

%install
%make_install

%files
%{_bindir}/%{name}
%{_datadir}/%{name}/*
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
