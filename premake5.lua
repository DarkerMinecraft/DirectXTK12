workspace "DirectXTK12"
    configurations { "Debug", "Release" }
    platforms { "x64"}
    location "build"
    language "C++"
    cppdialect "C++17"
    architecture "x64"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
    
    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

project "DirectXTK12"
    kind "StaticLib"
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"
    objdir "bin-int/%{cfg.buildcfg}"

    includedirs { "Inc" }
    
    files {
        "Inc/**.h",
        "Src/**.cpp",
        "Src/**.hlsl",
    }

    -- Precompiled header
    pchheader "pch.h"
    pchsource "Src/pch.cpp"

    filter "files:**.hlsl"
        buildaction "Embed"

    filter "system:windows"
        defines { "_WINDOWS" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
    
    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

    -- Custom options
    newoption {
        trigger = "build_xaudio_win10",
        description = "Build for XAudio 2.9",
    }
    newoption {
        trigger = "build_xaudio_redist",
        description = "Build for XAudio2Redist",
    }
    newoption {
        trigger = "build_gameinput",
        description = "Build for GameInput",
    }
    newoption {
        trigger = "build_wgi",
        description = "Build for Windows.Gaming.Input",
    }
    newoption {
        trigger = "build_xinput",
        description = "Build for XInput",
    }
    newoption {
        trigger = "enable_spectre_mitigation",
        description = "Build using /Qspectre for MSVC",
    }
    newoption {
        trigger = "disable_msvc_iterator_debugging",
        description = "Disable iterator debugging in Debug configurations with the MSVC CRT",
    }
    newoption {
        trigger = "enable_code_analysis",
        description = "Use Static Code Analysis on build",
    }
    newoption {
        trigger = "use_prebuilt_shaders",
        description = "Use externally built HLSL shaders",
    }
    newoption {
        trigger = "build_dxil_shaders",
        description = "Use DXC Shader Model 6 for shaders",
    }
    newoption {
        trigger = "no_wchar_t",
        description = "Use legacy wide-character as unsigned short",
    }
    newoption {
        trigger = "build_fuzzing",
        description = "Build for fuzz testing",
    }
    newoption {
        trigger = "build_mixed_dx11",
        description = "Support linking with DX11 version of toolkit",
    }

    filter { "options:build_xaudio_win10" }
        defines { "BUILD_XAUDIO_WIN10" }

    filter { "options:build_xaudio_redist" }
        defines { "BUILD_XAUDIO_REDIST" }

    filter { "options:build_gameinput" }
        defines { "BUILD_GAMEINPUT" }

    filter { "options:build_wgi" }
        defines { "BUILD_WGI" }

    filter { "options:build_xinput" }
        defines { "BUILD_XINPUT" }

    filter { "options:enable_spectre_mitigation" }
        defines { "ENABLE_SPECTRE_MITIGATION" }
    
    filter { "options:disable_msvc_iterator_debugging" }
        defines { "DISABLE_MSVC_ITERATOR_DEBUGGING" }

    filter { "options:enable_code_analysis" }
        defines { "ENABLE_CODE_ANALYSIS" }

    filter { "options:use_prebuilt_shaders" }
        defines { "USE_PREBUILT_SHADERS" }

    filter { "options:build_dxil_shaders" }
        defines { "BUILD_DXIL_SHADERS" }

    filter { "options:no_wchar_t" }
        defines { "NO_WCHAR_T" }

    filter { "options:build_fuzzing" }
        defines { "BUILD_FUZZING" }

    filter { "options:build_mixed_dx11" }
        defines { "BUILD_MIXED_DX11" }
