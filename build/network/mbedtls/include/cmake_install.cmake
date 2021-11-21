# Install script for directory: /home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/aes.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/aesni.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/arc4.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/aria.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/asn1.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/asn1write.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/base64.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/bignum.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/blowfish.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/bn_mul.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/camellia.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ccm.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/certs.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/chacha20.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/chachapoly.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/check_config.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/cipher.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/cipher_internal.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/cmac.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/compat-1.3.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/config.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ctr_drbg.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/debug.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/des.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/dhm.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ecdh.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ecdsa.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ecjpake.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ecp.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ecp_internal.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/entropy.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/entropy_poll.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/error.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/gcm.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/havege.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/hkdf.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/hmac_drbg.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/md.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/md2.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/md4.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/md5.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/md_internal.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/net.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/net_sockets.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/nist_kw.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/oid.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/padlock.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/pem.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/pk.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/pk_internal.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/pkcs11.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/pkcs12.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/pkcs5.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/platform.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/platform_time.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/platform_util.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/poly1305.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ripemd160.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/rsa.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/rsa_internal.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/sha1.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/sha256.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/sha512.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ssl.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ssl_cache.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ssl_cookie.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ssl_internal.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/ssl_ticket.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/threading.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/timing.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/version.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/x509.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/x509_crl.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/x509_crt.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/x509_csr.h"
    "/home/easyboard/lon_tools/mqtt1110/mqttclient-master/network/mbedtls/include/mbedtls/xtea.h"
    )
endif()

