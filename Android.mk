LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# compile in ARM mode, since the glyph loader/renderer is a hotspot
# when loading complex pages in the browser
#
# Uncomment to compile with ARM instruction set instead of Thumb
#LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES:= \
    src/base/ftsystem.c     \
    src/base/ftinit.c       \
    src/base/ftdebug.c      \
    src/base/ftbase.c       \
    src/base/ftbbox.c       \
    src/base/ftglyph.c      \
    src/base/ftbdf.c        \
    src/base/ftbitmap.c     \
    src/base/ftcid.c        \
    src/base/ftfstype.c     \
    src/base/ftgasp.c       \
    src/base/ftgxval.c      \
    src/base/ftlcdfil.c     \
    src/base/ftmm.c         \
    src/base/ftotval.c      \
    src/base/ftpatent.c     \
    src/base/ftpfr.c        \
    src/base/ftstroke.c     \
    src/base/ftsynth.c      \
    src/base/fttype1.c      \
    src/base/ftwinfnt.c     \
    src/base/ftxf86.c       \
    src/bdf/bdf.c           \
    src/cff/cff.c           \
    src/cid/type1cid.c      \
    src/pcf/pcf.c           \
    src/pfr/pfr.c           \
    src/sfnt/sfnt.c         \
    src/truetype/truetype.c \
    src/type1/type1.c       \
    src/type42/type42.c     \
    src/winfonts/winfnt.c   \
    src/raster/raster.c     \
    src/smooth/smooth.c     \
    src/autofit/autofit.c   \
    src/cache/ftcache.c     \
    src/gzip/ftgzip.c       \
    src/lzw/ftlzw.c         \
    src/bzip2/ftbzip2.c     \
    src/gxvalid/gxvalid.c   \
    src/otvalid/otvalid.c   \
    src/psaux/psaux.c       \
    src/pshinter/pshinter.c \
    src/psnames/psnames.c   

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/builds \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/include/freetype \
    $(LOCAL_PATH)/include/freetype/config \
    $(LOCAL_PATH)/include/freetype/internal

LOCAL_CFLAGS += -W -Wall -fvisibility=hidden
LOCAL_CFLAGS += -fPIC -DPIC
LOCAL_CFLAGS += "-DDARWIN_NO_CARBON"
LOCAL_CFLAGS += "-DFT2_BUILD_LIBRARY"

# enable the FreeType internal memory debugger in the simulator
# you need to define the FT2_DEBUG_MEMORY environment variable
# when running the program to activate it. It will dump memory
# statistics when FT_Done_FreeType is called
#
ifeq ($(TARGET_SIMULATOR),true)
LOCAL_CFLAGS += "-DFT_DEBUG_MEMORY"
endif

# the following is for testing only, and should not be used in final builds
# of the product
#LOCAL_CFLAGS += "-DTT_CONFIG_OPTION_BYTECODE_INTERPRETER"

LOCAL_CFLAGS += -O2

LOCAL_MODULE:= freetype2

include $(BUILD_STATIC_LIBRARY)