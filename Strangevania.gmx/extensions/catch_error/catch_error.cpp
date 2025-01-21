#pragma once
#include "stdafx.h"
#include <vector>
#if ((defined(_MSVC_LANG) && _MSVC_LANG >= 201703L) || __cplusplus >= 201703L)
#include <optional>
#endif
#include <stdint.h>
#include <cstring>
#include <tuple>
using namespace std;

#define dllg /* tag */

#if defined(WIN32)
#define dllx extern "C" __declspec(dllexport)
#elif defined(GNUC)
#define dllx extern "C" __attribute__ ((visibility("default"))) 
#else
#define dllx extern "C"
#endif

#ifdef _WINDEF_
typedef HWND GAME_HWND;
#endif

struct gml_buffer {
private:
	uint8_t* _data;
	int32_t _size;
	int32_t _tell;
public:
	gml_buffer() : _data(nullptr), _tell(0), _size(0) {}
	gml_buffer(uint8_t* data, int32_t size, int32_t tell) : _data(data), _size(size), _tell(tell) {}

	inline uint8_t* data() { return _data; }
	inline int32_t tell() { return _tell; }
	inline int32_t size() { return _size; }
};

class gml_istream {
	uint8_t* pos;
	uint8_t* start;
public:
	gml_istream(void* origin) : pos((uint8_t*)origin), start((uint8_t*)origin) {}

	template<class T> T read() {
		static_assert(std::is_trivially_copyable_v<T>, "T must be trivially copyable to be read");
		T result{};
		std::memcpy(&result, pos, sizeof(T));
		pos += sizeof(T);
		return result;
	}

	char* read_string() {
		char* r = (char*)pos;
		while (*pos != 0) pos++;
		pos++;
		return r;
	}

	template<class T> std::vector<T> read_vector() {
		static_assert(std::is_trivially_copyable_v<T>, "T must be trivially copyable to be read");
		auto n = read<uint32_t>();
		std::vector<T> vec(n);
		std::memcpy(vec.data(), pos, sizeof(T) * n);
		pos += sizeof(T) * n;
		return vec;
	}

	gml_buffer read_gml_buffer() {
		auto _data = (uint8_t*)read<int64_t>();
		auto _size = read<int32_t>();
		auto _tell = read<int32_t>();
		return gml_buffer(_data, _size, _tell);
	}

	#pragma region Tuples
	#if ((defined(_MSVC_LANG) && _MSVC_LANG >= 201703L) || __cplusplus >= 201703L)
	template<typename... Args>
	std::tuple<Args...> read_tuple() {
		std::tuple<Args...> tup;
		std::apply([this](auto&&... arg) {
			((
				arg = this->read<std::remove_reference_t<decltype(arg)>>()
				), ...);
			}, tup);
		return tup;
	}

	template<class T> optional<T> read_optional() {
		if (read<bool>()) {
			return read<T>;
		} else return {};
	}
	#else
	template<class A, class B> std::tuple<A, B> read_tuple() {
		A a = read<A>();
		B b = read<B>();
		return std::tuple<A, B>(a, b);
	}

	template<class A, class B, class C> std::tuple<A, B, C> read_tuple() {
		A a = read<A>();
		B b = read<B>();
		C c = read<C>();
		return std::tuple<A, B, C>(a, b, c);
	}

	template<class A, class B, class C, class D> std::tuple<A, B, C, D> read_tuple() {
		A a = read<A>();
		B b = read<B>();
		C c = read<C>();
		D d = read<d>();
		return std::tuple<A, B, C, D>(a, b, c, d);
	}
	#endif
};

class gml_ostream {
	uint8_t* pos;
	uint8_t* start;
public:
	gml_ostream(void* origin) : pos((uint8_t*)origin), start((uint8_t*)origin) {}

	template<class T> void write(T val) {
		static_assert(std::is_trivially_copyable_v<T>, "T must be trivially copyable to be write");
		memcpy(pos, &val, sizeof(T));
		pos += sizeof(T);
	}

	void write_string(const char* s) {
		for (int i = 0; s[i] != 0; i++) write<char>(s[i]);
		write<char>(0);
	}

	template<class T> void write_vector(std::vector<T>& vec) {
		static_assert(std::is_trivially_copyable_v<T>, "T must be trivially copyable to be write");
		auto n = vec.size();
		write<uint32_t>(n);
		memcpy(pos, vec.data(), n * sizeof(T));
		pos += n * sizeof(T);
	}

	#if ((defined(_MSVC_LANG) && _MSVC_LANG >= 201703L) || __cplusplus >= 201703L)
	template<typename... Args>
	void write_tuple(std::tuple<Args...> tup) {
		std::apply([this](auto&&... arg) {
			(this->write(arg), ...);
			}, tup);
	}

	template<class T> void write_optional(optional<T>& val) {
		auto hasValue = val.has_value();
		write<bool>(hasValue);
		if (hasValue) write<T>(val.value());
	}
	#else
	template<class A, class B> void write_tuple(std::tuple<A, B>& tup) {
		write<A>(std::get<0>(tup));
		write<B>(std::get<1>(tup));
	}
	template<class A, class B, class C> void write_tuple(std::tuple<A, B, C>& tup) {
		write<A>(std::get<0>(tup));
		write<B>(std::get<1>(tup));
		write<C>(std::get<2>(tup));
	}
	template<class A, class B, class C, class D> void write_tuple(std::tuple<A, B, C, D>& tup) {
		write<A>(std::get<0>(tup));
		write<B>(std::get<1>(tup));
		write<C>(std::get<2>(tup));
		write<D>(std::get<3>(tup));
	}
	#endif
};
#include "stdafx.h"

extern uint8_t* catch_error_suppress;
extern bool catch_error_fatal_force;
extern int catch_error_fatal_hooked;

constexpr int searchBufSize = 16384;
uint8_t searchBuf[searchBufSize];
struct EBP {
	EBP* next;
	void* func;
};
#ifdef NDEBUG
__forceinline
#endif
void initFatal() { // welcome to heck
	catch_error_fatal_force = false;
	// So we need to do two things here:
	// 1. Make fatal errors recognize which button was pressed (bug? feature?)
	// 2. Find the address of "suppress errors" flag for YYError
	EBP* _ebp = nullptr;
	__asm { mov _ebp, ebp };
	if (_ebp == nullptr) {
		trace("Can't hook, EBP is NULL");
		return;
	}
	//
	#ifdef _DEBUG
	_ebp = _ebp->next; // 
	#endif
	_ebp = _ebp->next;
	uint8_t* calledFrom = (uint8_t*)_ebp->func;
	if (calledFrom[0] == 0x89) { // extra layer..?
		_ebp = _ebp->next;
		calledFrom = (uint8_t*)_ebp->func;
	}
	uint8_t newJmp = 8;
	if (calledFrom[0] == 0x83) { // has duplicated ADD ECX 8?
		calledFrom += 3;
		newJmp += 6;
	}
	do {
		catch_error_fatal_hooked = -1;
		// The caller goes like this:
		// +00  E8 ## ## ## ##       call        <our caller>
		// +05  EB 0A                jmp         <somewhere else>
		// +07  6A 01                push        1
		// +09  57                   push        edi
		// +0A  E8 ## ## ## ##       call        <our caller>
		// +0F  8A D8                mov         bl, al           (can be a fancier mov)
		// So, to retrieve result on first branch, we need to reroute jmp
		// to land on the mov after the second call.
		if (calledFrom[0] != 0xEB) { // we want a JMP
			trace("Can't hook fatal error handling - unusual caller? (v=%X, at=%X)",
				calledFrom[0], calledFrom);
			continue;
		}
		// for some reason, we can't straight up assign/memcpy this bit
		HANDLE hp = GetCurrentProcess();
		SIZE_T done;
		uint8_t orig = calledFrom[1];
		if (WriteProcessMemory(hp, calledFrom + 1, &newJmp, 1, &done) == 0) {
			trace("Failed to hook fatals - error %d", GetLastError());
			continue;
		} else {
			trace("Legacy format errors can now be non-fatal (address=%x, old=%x, new=%x)", calledFrom + 1, orig, calledFrom[1]);
		}
		//
		uint8_t* endsAt = nullptr;
		uint8_t endsSig[] = { 0xC3/*RET*/, 0xCC, 0xCC};
		for (int i = 0; i < 1024; i++) {
			if (memcmp(calledFrom + i, &endsSig, sizeof(endsSig)) != 0) continue;
			endsAt = calledFrom + i;
			break;
		}
		if (endsAt == nullptr) {
			trace("Couldn't find where the error function ends (??)");
			catch_error_fatal_hooked = 1;
			continue;
		}
		uint8_t* p = endsAt;
		while (--p > calledFrom) {
			// we're looking for CMP byte ptr <addr>, 0
			if (p[0] != 0x80/*CMP*/) continue;
			if (p[1] != 0x3D) continue;
			if (p[6] != 0x00) continue;
			//
			bool hasJNE = false;
			int n = endsAt - p;
			if (n > 40) n = 40;
			for (int i = 7; i < n; i++) {
				if (p[i] != 0x75) continue;
				if (p[i + 1] > 0x40) continue;
				hasJNE = true;
				break;
			}
			//
			if (!hasJNE) continue;
			catch_error_suppress = (uint8_t*)(*(uint32_t*)(p + 2));
			trace("Error suppression flag located (address=%x), first used at %x", catch_error_suppress, p + 2);

			// things get weird here. So we have a few functions in a static lib
			// that are used for showing formatted errors, and go like
			// void YYError(const char* format, ...) {
			//     if (suppress) return;
			//     sprintf(...);
			//     if (!suppress) {
			//         show_error(...); <- the function that calls our function
			//         exit(-1); <- CRT exit
			//     }
			// }
			// and we need to have them not call exit()
			// (because then we can't handle our errors from game code, you know)
			// but these are small enough for C++ compiler to not put them on EBP, so...
			// we kind of just scan surrounding memory to find them
			uint8_t cmp_sup_0__jne[] = { 0x80, 0x3D, p[2], p[3], p[4], p[5], 0 };
			const int tailSize = 128;
			const int stepSize = searchBufSize - tailSize;
			uint8_t* searchbuf = searchBuf;
			bool sign_ok[2] = { true, true };
			for (int step = 0; step < 128; step++) for (int sign = 0; sign < 2; sign++) {
				if (sign_ok[sign] == false) continue;
				uint8_t* chunkPos;
				if (sign) {
					chunkPos = p - (step + 1) * stepSize - 256;
				} else chunkPos = p + step * stepSize + 4;
				if (ReadProcessMemory(hp, chunkPos, searchbuf, searchBufSize, &done) == 0) {
					trace("Reached unreadable memory at side=%d adr=%x", sign, chunkPos);
					sign_ok[sign] = false;
					if (!sign_ok[0] && !sign_ok[1]) break;
				}
				//trace("check %x %d", chunkPos, chunkPos - p);
				for (int i = 0; i < stepSize; i++) {
					if (memcmp(searchbuf + i, cmp_sup_0__jne, sizeof(cmp_sup_0__jne)) != 0) continue;
					uint8_t* up = chunkPos + i;
					uint8_t cmpJmp = up[sizeof(cmp_sup_0__jne)];
					if (cmpJmp == 0x74 || cmpJmp == 0x8B) {
						uint8_t* setFlagAt = up - 7;
						if (cmpJmp == 0x8B) {
							// cmp Sup, 0; mov ecx, ?; mov Magic, 1
							setFlagAt = up + 14;
						} else if (setFlagAt[0] != 0xC6) {
							// oh, is it the other-way-around version
							setFlagAt = up + sizeof(cmp_sup_0__jne) + 2;
							if (setFlagAt[0] != 0xC6) {
								// come on now
								setFlagAt = up + sizeof(cmp_sup_0__jne) + 9;
							}
						}
						if (setFlagAt[0] != 0xC6) continue;
						if (setFlagAt[1] != 0x05) continue;
						if (setFlagAt[6] != 0x01) continue;
						uint8_t jumpOver[] = { 0xEB, 5 };
						if (WriteProcessMemory(hp, setFlagAt, &jumpOver, sizeof(jumpOver), &done) == 0) {
							trace("Failed to patch error flag at %x - error %d", GetLastError());
						} else {
							trace("Patched %x to not set the error magic flag", setFlagAt);
						}
						continue;
					} else if (cmpJmp != 0x75) continue;
					uint8_t* retAt = up + sizeof(cmp_sup_0__jne) + 2 + (int8_t)up[sizeof(cmp_sup_0__jne) + 1];

					//trace("Error suppression flag used at %x, return at %x", up, retAt);
					// look for cleanup after show_error:
					uint8_t* cleanupAt = up + (sizeof(cmp_sup_0__jne) + 2);
					uint8_t* cleanupTill = cleanupAt + 64;
					uint8_t cleanupSig[] = { 0x83, 0xC4, 0x08 }; // add ESP, 8
					for (; cleanupAt < cleanupTill; cleanupAt++) {
						if (memcmp(cleanupAt, cleanupSig, sizeof(cleanupSig)) != 0) continue;
						cleanupAt += sizeof(cleanupSig);
						int jumpToRetOfs = cleanupAt + 2 - retAt;
						if (jumpToRetOfs > 128) {
							trace("Can't patch exit() at %x - have to go too far", cleanupAt, jumpToRetOfs);
							break;
						}
						uint8_t jumpToRet[] = { 0xEB, (uint8_t)(0x100 - jumpToRetOfs) };
						if (WriteProcessMemory(hp, cleanupAt, &jumpToRet, sizeof(jumpToRet), &done) == 0) {
							trace("Failed to patch exit() at %x - error %d", GetLastError());
						} else {
							trace("Patched %x to not immediately exit on fatal errors", cleanupAt);
						}
						break;
					}
				}
			}
			break;
		}
		if (catch_error_suppress == nullptr) trace("Couldn't find error suppression flag.");
		//
		catch_error_fatal_hooked = 1;
	} while (false);
}//{{NO_DEPENDENCIES}}
// Microsoft Visual C++ generated include file.
// Used by catch_error.rc

// Next default values for new objects
// 
#ifdef APSTUDIO_INVOKED
#ifndef APSTUDIO_READONLY_SYMBOLS
#define _APS_NEXT_RESOURCE_VALUE        101
#define _APS_NEXT_COMMAND_VALUE         40001
#define _APS_NEXT_CONTROL_VALUE         1001
#define _APS_NEXT_SYMED_VALUE           101
#endif
#endif
// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#ifdef _WINDOWS
	#include "targetver.h"
	
	#define WIN32_LEAN_AND_MEAN // Exclude rarely-used stuff from Windows headers
	#include <windows.h>
#endif

#if ((defined(_MSVC_LANG) && _MSVC_LANG >= 201703L) || __cplusplus >= 201703L)
#define tiny_cpp17
#endif

#if defined(WIN32)
#define dllx extern "C" __declspec(dllexport)
#elif defined(GNUC)
#define dllx extern "C" __attribute__ ((visibility("default"))) 
#else
#define dllx extern "C"
#endif

#define _trace // requires user32.lib;Kernel32.lib
#ifdef TINY
#define tiny_memset
#define tiny_memcpy
#define tiny_malloc
//#define tiny_dtoui3
#endif

#ifdef _trace
#ifdef _WINDOWS
void trace(const char* format, ...);
#else
#define trace(...) { printf("[catch_error:%d] ", __LINE__); printf(__VA_ARGS__); printf("\n"); fflush(stdout); }
#endif
#endif

#pragma region typed memory helpers
template<typename T> T* malloc_arr(size_t count) {
	return (T*)malloc(sizeof(T) * count);
}
template<typename T> T* realloc_arr(T* arr, size_t count) {
	return (T*)realloc(arr, sizeof(T) * count);
}
template<typename T> T* memcpy_arr(T* dst, const T* src, size_t count) {
	return (T*)memcpy(dst, src, sizeof(T) * count);
}
#pragma endregion

#include "gml_ext.h"

// TODO: reference additional headers your program requires here
#pragma once

// Including SDKDDKVer.h defines the highest available Windows platform.

// If you wish to build your application for a previous Windows platform, include WinSDKVer.h and
// set the _WIN32_WINNT macro to the platform you wish to support before including SDKDDKVer.h.

#include <SDKDDKVer.h>
#pragma once
#include "stdafx.h"

template<typename T> class tiny_array {
	T* _data;
	size_t _size;
	size_t _capacity;

	bool add_impl(T value) {
		if (_size >= _capacity) {
			auto new_capacity = _capacity * 2;
			auto new_data = realloc_arr(_data, _capacity);
			if (new_data == nullptr) {
				trace("Failed to reallocate %u bytes in tiny_array::add", sizeof(T) * new_capacity);
				return false;
			}
			for (size_t i = _capacity; i < new_capacity; i++) new_data[i] = {};
			_data = new_data;
			_capacity = new_capacity;
		}
		_data[_size++] = value;
		return true;
	}
public:
	tiny_array() { }
	tiny_array(size_t capacity) { init(capacity); }
	inline void init(size_t capacity = 4) {
		if (capacity < 1) capacity = 1;
		_size = 0;
		_capacity = capacity;
		_data = malloc_arr<T>(capacity);
	}
	inline void free() {
		if (_data) {
			::free(_data);
			_data = nullptr;
		}
	}

	size_t size() { return _size; }
	size_t capacity() { return _capacity; }
	T* data() { return _data; }

	bool resize(size_t newsize, T value = {}) {
		if (newsize > _capacity) {
			auto new_data = realloc_arr(_data, newsize);
			if (new_data == nullptr) {
				trace("Failed to reallocate %u bytes in tiny_array::resize", sizeof(T) * newsize);
				return false;
			}
			_data = new_data;
			_capacity = newsize;
		}
		for (size_t i = _size; i < newsize; i++) _data[i] = value;
		for (size_t i = _size; --i >= newsize;) _data[i] = value;
		_size = newsize;
		return true;
	}

	#ifdef tiny_cpp17
	template<class... Args>
	inline bool add(Args... values) {
		return (add_impl(values) && ...);
	}
	#else
	inline void add(T value) {
		add_impl(value);
	}
	#endif

	bool remove(size_t index, size_t count = 1) {
		size_t end = index + count;
		if (end < _size) {
			memcpy_arr(_data + index, _data + end, _size - end);
		}
		_size -= count;
		return true;
	}

	bool set(T* values, size_t count) {
		if (!resize(count)) return false;
		memcpy_arr(_data, values, count);
		return true;
	}
	template<size_t count> inline bool set(T(&values)[count]) {
		return set(values, count);
	}

	T operator[] (size_t index) const { return _data[index]; }
	T& operator[] (size_t index) { return _data[index]; }
};#pragma once
#include "stdafx.h"

template<typename T> struct tiny_set {
private:
	T* _arr;
	size_t _length;
	size_t _capacity;
public:
	tiny_set() {}
	tiny_set(size_t capacity) { init(capacity); }
	void init(size_t capacity = 4) {
		_capacity = capacity;
		_length = 0;
		_arr = malloc_arr<T>(_capacity);
	}

	static const size_t npos = MAXSIZE_T;
	size_t find(T val) {
		for (size_t i = 0; i < _length; i++) {
			if (_arr[i] == val) return i;
		}
		return npos;
	}
	inline bool contains(T val) {
		return find(val) != npos;
	}

	bool add(T val) {
		if (find(val) != npos) return false;
		if (_length >= _capacity) {
			_capacity *= 2;
			_arr = realloc_arr(_arr, _capacity);
		}
		_arr[_length++] = val;
		return true;
	}
	bool remove(T val) {
		auto i = find(val);
		if (i == npos) return false;
		_length -= 1;
		for (; i < _length; i++) _arr[i] = _arr[i + 1];
		return true;
	}
	bool set(T val, bool on) {
		if (on) return add(val); else return remove(val);
	}
};#pragma once
#include "stdafx.h"

template<typename C> class tiny_string_t {
	C* _data = nullptr;
	size_t _size = 0;
	size_t _capacity = 0;
public:
	tiny_string_t() {}
	inline void init(size_t capacity = 32) {
		_data = malloc_arr<C>(capacity);
		_size = 0;
		_capacity = capacity;
	}
	inline void init(const C* val) {
		init(4);
		set(val);
	}

	inline size_t size() { return _size; }
	inline void setSize(size_t size) { _size = size; }

	inline bool empty() {
		return _size == 0;
	}
	inline C* c_str() {
		return _data;
	}
	inline C* prepare(size_t capacity) {
		if (_capacity < capacity) {
			auto new_data = realloc_arr(_data, capacity);
			if (new_data == nullptr) {
				trace("Failed to reallocate %u bytes in tiny_string::prepare", sizeof(C) * capacity);
				return nullptr;
			}
			_data = new_data;
			_capacity = capacity;
		}
		return _data;
	}
	inline const C* set(const C* value, size_t len = SIZE_MAX) {
		if (len == SIZE_MAX) {
			const C* iter = value;
			len = 1;
			while (*iter) { iter++; len++; }
		}
		C* result = prepare(len);
		memcpy_arr(result, value, len);
		_size = len - 1;
		return result;
	}
	//
	inline void operator=(const C* value) { set(value); }
	template<size_t size> inline void operator =(const C(&value)[size]) { set(value, size); }
};
struct tiny_string : public tiny_string_t<char> {
public:
	inline char* conv(const wchar_t* wstr) {
		auto size = WideCharToMultiByte(CP_UTF8, 0, wstr, -1, NULL, 0, NULL, NULL);
		auto str = prepare(size);
		WideCharToMultiByte(CP_UTF8, 0, wstr, -1, str, size, NULL, NULL);
		setSize(size);
		return str;
	}

	inline void operator=(const char* value) { set(value); }
	template<size_t size> inline void operator =(const char(&value)[size]) { set(value, size); }
};
struct tiny_wstring : public tiny_string_t<wchar_t> {
public:
	inline wchar_t* conv(const char* str) {
		auto size = MultiByteToWideChar(CP_UTF8, 0, str, -1, NULL, 0);
		auto wstr = prepare(size);
		MultiByteToWideChar(CP_UTF8, 0, str, -1, wstr, size);
		setSize(size);
		return wstr;
	}

	inline void operator=(const wchar_t* value) { set(value); }
	template<size_t size> inline void operator =(const wchar_t(&value)[size]) { set(value, size); }
};#include "stdafx.h"
#pragma once

BOOL InstallHook(LPCSTR module, LPCSTR function, void* hook, void** original);

template<typename T>
BOOL InstallHookTyped(LPCSTR module, LPCSTR function, T proto, T hook, T* out_orig) {
	return InstallHook(module, function, hook, (void**)out_orig);
}

#define WinFuncHook(ret_type, name, ...)\
	ret_type(WINAPI* name##_base)(__VA_ARGS__) = 0;\
	ret_type WINAPI  name##_hook (__VA_ARGS__)
#define WinFuncHookSet(module, name)\
	if (!InstallHookTyped(module, #name, name, name##_hook, &name##_base)) trace("Failed to hook " #name "!");#include "gml_ext.h"
extern bool catch_error_set_normal(int catch_error_normal_);
dllx double catch_error_set_normal_raw(void* _in_ptr, double _in_ptr_size) {
	gml_istream _in(_in_ptr);
	int _arg_catch_error_normal_;
	_arg_catch_error_normal_ = _in.read<int>();
	return catch_error_set_normal(_arg_catch_error_normal_);
}

extern int catch_error_get_normal();
dllx double catch_error_get_normal_raw(void* _in_ptr, double _in_ptr_size) {
	gml_istream _in(_in_ptr);
	return catch_error_get_normal();
}

extern bool catch_error_set_fatal(int catch_error_fatal_);
dllx double catch_error_set_fatal_raw(void* _in_ptr, double _in_ptr_size) {
	gml_istream _in(_in_ptr);
	int _arg_catch_error_fatal_;
	_arg_catch_error_fatal_ = _in.read<int>();
	return catch_error_set_fatal(_arg_catch_error_fatal_);
}

extern int catch_error_get_fatal();
dllx double catch_error_get_fatal_raw(void* _in_ptr, double _in_ptr_size) {
	gml_istream _in(_in_ptr);
	return catch_error_get_fatal();
}

extern bool catch_error_set_prompt(int catch_error_prompt_, const char* text, const char* title, int MSDN_MessageBox_type);
dllx double catch_error_set_prompt_raw(void* _in_ptr, double _in_ptr_size, const char* _arg_text, const char* _arg_title) {
	gml_istream _in(_in_ptr);
	int _arg_catch_error_prompt_;
	_arg_catch_error_prompt_ = _in.read<int>();
	int _arg_MSDN_MessageBox_type;
	if (_in.read<bool>()) {
		_arg_MSDN_MessageBox_type = _in.read<int>();
	} else _arg_MSDN_MessageBox_type = -1;
	return catch_error_set_prompt(_arg_catch_error_prompt_, _arg_text, _arg_title, _arg_MSDN_MessageBox_type);
}

extern bool catch_error_set_dump_path(const char* path);
dllx double catch_error_set_dump_path_raw(void* _in_ptr, double _in_ptr_size, const char* _arg_path) {
	gml_istream _in(_in_ptr);
	return catch_error_set_dump_path(_arg_path);
}

extern bool catch_error_set_exec(const char* path, const char* args);
dllx double catch_error_set_exec_raw(void* _in_ptr, double _in_ptr_size, const char* _arg_path, const char* _arg_args) {
	gml_istream _in(_in_ptr);
	return catch_error_set_exec(_arg_path, _arg_args);
}

/// @author YellowAfterlife

#include "stdafx.h"
#include "tiny_string.h"
#include "tiny_array.h"
#include "winapi_hooking.h"
#include "magic_patcher.h"
#include <shellapi.h>

// turns out that you can use a non-__stdcall handler and GameMaker does.
typedef INT_PTR(*YYDLGPROC)(HWND, UINT, WPARAM, LPARAM);

bool catch_error_proc;
bool catch_error_ready;
bool catch_error_is_fatal;
tiny_wstring catch_error_text;
HWND catch_error_dummy = nullptr;

tiny_string ret_string_buf;
const char* ret_string(const wchar_t* wstr) {
	return ret_string_buf.conv(wstr);
}
const char* ret_string(tiny_wstring& wstr) {
	return ret_string_buf.conv(wstr.c_str());
}
void initVars() {
	ret_string_buf.init();
	catch_error_proc = false;
	catch_error_ready = false;
	catch_error_is_fatal = false;
	catch_error_text.init(L"");
	catch_error_dummy = CreateWindowExW(WS_EX_LEFT, L"Message", L"Message", 0, 0, 0, 0, 0, HWND_MESSAGE, 0, 0, 0);
}

void ProcessMessages() {
	tagMSG m;
	while (true) {
		if (PeekMessageW(&m, NULL, 0, 0, PM_REMOVE)) {
			if (m.message != WM_QUIT) {
				TranslateMessage(&m);
				DispatchMessageW(&m);
			} else break;
		} else break;
	}
}
void WaitUp() {
	catch_error_proc = true;
	Sleep(100);
	ProcessMessages();
	Sleep(100);
	ProcessMessages();
	catch_error_proc = false;
}

#pragma region normal
///
enum catch_error_normal_t {
	catch_error_normal_show,
	catch_error_normal_ignore,
	catch_error_normal_queue,
	catch_error_normal_quit,
};
catch_error_normal_t catch_error_normal_mode;
dllg bool catch_error_set_normal(int catch_error_normal_) {
	catch_error_normal_mode = (catch_error_normal_t)catch_error_normal_;
	return true;
}
dllg int catch_error_get_normal() {
	return (int)catch_error_normal_mode;
}
#pragma endregion

#pragma region fatal
///
enum catch_error_fatal_t {
	catch_error_fatal_show,
	catch_error_fatal_ignore,
	catch_error_fatal_queue,
	catch_error_fatal_quit,
};
catch_error_fatal_t catch_error_fatal_mode;
dllg bool catch_error_set_fatal(int catch_error_fatal_) {
	catch_error_fatal_mode = (catch_error_fatal_t)catch_error_fatal_;
	return true;
}
///
dllg int catch_error_get_fatal() {
	return catch_error_fatal_mode;
}
#pragma endregion

#pragma region prompt
///
enum catch_error_prompt_t {
	catch_error_prompt_none,
	catch_error_prompt_message,
	catch_error_prompt_question,
};
catch_error_prompt_t catch_error_prompt_kind;
tiny_wstring catch_error_prompt_text;
tiny_wstring catch_error_prompt_title;
DWORD catch_error_prompt_flags;
dllg bool catch_error_set_prompt(int catch_error_prompt_, const char* text = "", const char* title = "", int MSDN_MessageBox_type = -1) {
	catch_error_prompt_kind = (catch_error_prompt_t)catch_error_prompt_;
	catch_error_prompt_text.conv(text);
	catch_error_prompt_title.conv(title);
	if (MSDN_MessageBox_type >= 0) catch_error_prompt_flags = (DWORD)MSDN_MessageBox_type;
	return true;
}
///
dllx double catch_error_get_prompt_kind() {
	return catch_error_prompt_kind;
}
///
dllx double catch_error_get_prompt_flags() {
	return catch_error_prompt_kind;
}
///
dllx const char* catch_error_get_prompt_text() {
	return ret_string(catch_error_prompt_text);
}
///
dllx const char* catch_error_get_prompt_title() {
	return ret_string(catch_error_prompt_title);
}
#pragma endregion

#pragma region dump
tiny_wstring catch_error_dump_path;
dllg bool catch_error_set_dump_path(const char* path = "") {
	catch_error_dump_path.conv(path);
	return 1;
}
///
dllx const char* catch_error_get_dump_path() {
	return ret_string(catch_error_dump_path);
}
#pragma endregion

#pragma region queue
tiny_array<wchar_t*> catch_error_queue;
/// Returns you the next error from queue (or "" if empty)
dllx const char* catch_error_dequeue() {
	if (catch_error_queue.size() == 0) return "";
	auto wstring = catch_error_queue[0];
	auto result = ret_string(wstring);
	free(wstring);
	catch_error_queue.remove(0);
	return result;
}
/// Clears any queued error messages, returns how many there were
dllx double catch_error_clear() {
	auto len = catch_error_queue.size();
	for (size_t i = 0; i < len; i++) free(catch_error_queue[i]);
	catch_error_queue.resize(0);
	return len;
}
/// Returns the number of error messages in queue
dllx double catch_error_size() {
	return catch_error_queue.size();
}
#pragma endregion

#pragma region exec
tiny_wstring catch_error_exec_path;
tiny_wstring catch_error_exec_args;
dllg bool catch_error_set_exec(const char* path = "", const char* args = "") {
	catch_error_exec_path.conv(path);
	catch_error_exec_args.conv(args);
	return true;
}
///
dllx const char* catch_error_get_exec_path() {
	return ret_string(catch_error_exec_path);
}
///
dllx const char* catch_error_get_exec_params() {
	return ret_string(catch_error_exec_args);
}
#pragma endregion

#pragma region newer
int catch_error_fatal_hooked;
bool catch_error_fatal_force;
dllx double catch_error_fatal_force_raw() {
	catch_error_fatal_force = true;
	return 1;
}

uint8_t* catch_error_suppress;
///
enum catch_error_newer_t {
	catch_error_newer_not_ready = -2,
	catch_error_newer_unavailable = -1,
	catch_error_newer_allow = 0,
	catch_error_newer_ignore = 1
};
catch_error_newer_t catch_error_newer_status;
/// ->catch_error_newer_*
dllx double catch_error_get_newer() {
	if (catch_error_fatal_hooked == 0) return catch_error_newer_not_ready;
	if (catch_error_suppress == nullptr) return catch_error_newer_unavailable;
	return *catch_error_suppress;
}
dllx double catch_error_set_newer_raw(double enable) {
	if (catch_error_fatal_hooked == 0) return catch_error_newer_not_ready;
	if (catch_error_suppress == nullptr) return catch_error_newer_unavailable;
	*catch_error_suppress = (enable > 0.5);
	return *catch_error_suppress;
}
#pragma endregion

void initModes() {
	catch_error_normal_mode = catch_error_normal_ignore;
	catch_error_fatal_mode = catch_error_fatal_quit;
	catch_error_prompt_kind = catch_error_prompt_none;
	catch_error_prompt_text.init(L"");
	catch_error_prompt_title.init(L"");
	catch_error_prompt_flags = 0x0;
	catch_error_dump_path.init(L"");
	catch_error_queue.init();
	//
	catch_error_exec_path.init(L"");
	catch_error_exec_args.init(L"");
	//
	catch_error_fatal_hooked = 0;
	catch_error_fatal_force = false;
	catch_error_suppress = nullptr;
	catch_error_newer_status = catch_error_newer_not_ready;
	//
}

void catch_error_soft_quit(HWND parent, bool showPrompt) {
	if (!catch_error_dump_path.empty()) {
		HANDLE df = CreateFileW(catch_error_dump_path.c_str(), GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
		if (df != INVALID_HANDLE_VALUE) {
			auto data = ret_string(catch_error_text);
			DWORD written;
			WriteFile(df, data, ret_string_buf.size(), &written, NULL);
			SetEndOfFile(df);
			CloseHandle(df);
		} else trace("Failed to dump to %ls: code %d", catch_error_dump_path.c_str(), GetLastError());
	}
	//
	bool shouldExec = true;
	if (showPrompt) switch (catch_error_prompt_kind) {
		case catch_error_prompt_message:
		case catch_error_prompt_question:
			DWORD flags = catch_error_prompt_flags;
			if (catch_error_prompt_kind == catch_error_prompt_question) {
				flags |= MB_YESNO;
			} else flags |= MB_OK;
			WaitUp();
			int bt = MessageBoxW(parent, catch_error_prompt_text.c_str(), catch_error_prompt_title.c_str(), flags);
			if (bt == IDNO) shouldExec = false;
			break;
	}
	//
	if (shouldExec && !catch_error_exec_path.empty()) {
		HINSTANCE app = ShellExecuteW(NULL, NULL, catch_error_exec_path.c_str(), catch_error_exec_args.c_str(), NULL, SW_SHOW);
		if ((int)app < 32) trace("Failed to run: %d", (int)app);
	}
}

WinFuncHook(INT_PTR, DialogBoxParamW, HINSTANCE inst, LPCWSTR tpl, HWND parent, DLGPROC proc, LPARAM param) {
	if (lstrcmpW(tpl, L"IDD_ERROR_CODE") != 0) return DialogBoxParamW_base(inst, tpl, parent, proc, param);

	// so we "dry run" the error dialog first to grab the text and whether it's fatal or not
	catch_error_proc = true;
	catch_error_text = L"";
	catch_error_is_fatal = false;
	YYDLGPROC yyproc = (YYDLGPROC)proc;
	yyproc(parent, WM_INITDIALOG, 0, 0);
	catch_error_proc = false;

	//
	auto fatal_mode = catch_error_fatal_mode;
	bool fatal_hook = catch_error_is_fatal && (fatal_mode == catch_error_fatal_ignore || fatal_mode == catch_error_fatal_queue);
	if ((fatal_hook || catch_error_fatal_force) && catch_error_fatal_hooked == 0) initFatal();
	if (fatal_hook && catch_error_fatal_hooked < 0) fatal_mode = catch_error_fatal_quit;

	if (catch_error_is_fatal) switch (fatal_mode) {
		case catch_error_fatal_quit:
			catch_error_soft_quit(parent, true);
			return 1;
		case catch_error_fatal_ignore:
		case catch_error_fatal_queue:
			if (catch_error_fatal_hooked < 0) return 1;
			if (catch_error_fatal_mode == catch_error_fatal_queue) {
				auto size = catch_error_text.size() + 1;
				auto str = malloc_arr<wchar_t>(size);
				memcpy_arr(str, catch_error_text.c_str(), size);
				catch_error_queue.add(str);
			}
			return 0;
	}
	else switch (catch_error_normal_mode) {
		case catch_error_normal_ignore:
			return 0;
		case catch_error_normal_queue: {
			auto size = catch_error_text.size() + 1;
			auto str = malloc_arr<wchar_t>(size);
			memcpy_arr(str, catch_error_text.c_str(), size);
			catch_error_queue.add(str);
			return 0;
		};
		case catch_error_normal_quit:
			catch_error_soft_quit(parent, true);
			return 1;
	}
	WaitUp();
	// show the original message box
	INT_PTR result = DialogBoxParamW_base(inst, tpl, parent, proc, param);
	if (result == 1) catch_error_soft_quit(parent, false);
	return result;
}

WinFuncHook(HWND, GetDlgItem, HWND hDlg, int nIDDlgItem) {
	if (catch_error_proc && nIDDlgItem == 4/* "Ignore" */) {
		// for this trick, we'll return our dummy HWND instead of the button,
		// and check for it in the function below:
		return catch_error_dummy;
	}
	return GetDlgItem_base(hDlg, nIDDlgItem);
}
WinFuncHook(BOOL, ShowWindow, HWND hWnd, int nCmdShow) {
	if (catch_error_proc && hWnd == catch_error_dummy) {
		catch_error_is_fatal = nCmdShow == SW_HIDE;
		return TRUE;
	}
	return ShowWindow_base(hWnd, nCmdShow);
}
WinFuncHook(BOOL, SetDlgItemTextW, HWND hDlg, int nIDDlgItem, LPCWSTR lpString) {
	if (catch_error_proc) {
		// store the error message string
		if (nIDDlgItem == 1001) catch_error_text = lpString;
		// (no need to set text - the function will be called again normally)
		return true;
	}
	return SetDlgItemTextW_base(hDlg, nIDDlgItem, lpString);
}
WinFuncHook(void, Sleep, DWORD dwMilliseconds) {
	if (dwMilliseconds == 100) {
		/*
		Error function goes like this:
			Sleep(100);
			<process window messages>;
			Sleep(100);
			<process window messages>;
			result = DialogBoxW(_, L"IDD_ERROR_CODE", ...);
		so this is the best way I could think of to prevent the game from stalling for 200ms whenever an error is caught
		*/
		return;
	}
	return Sleep_base(dwMilliseconds);
}

///
dllx double catch_error_is_ready() {
	return catch_error_ready;
}
/// returns whether the DLL successfully loaded as such
dllx double catch_error_is_loaded() {
	return true;
}
///
dllx double catch_error_init() {
	if (catch_error_ready) return 2;
	WinFuncHookSet("User32.dll", DialogBoxParamW);
	WinFuncHookSet("User32.dll", GetDlgItem);
	WinFuncHookSet("User32.dll", ShowWindow);
	WinFuncHookSet("User32.dll", SetDlgItemTextW);
	WinFuncHookSet("Kernel32.dll", Sleep);
	trace("All hooked!");
	catch_error_ready = true;
	return 1;
}

void init() {
	initVars();
	initModes();
}
BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved) {
	if (ul_reason_for_call == DLL_PROCESS_ATTACH) init();
	return TRUE;
}
// stdafx.cpp : source file that includes just the standard includes
// catch_error.pch will be the pre-compiled header
// stdafx.obj will contain the pre-compiled type information

#include "stdafx.h"
#include <strsafe.h>
#ifdef tiny_dtoui3
#include <intrin.h>
#endif

#if _WINDOWS
// http://computer-programming-forum.com/7-vc.net/07649664cea3e3d7.htm
extern "C" int _fltused = 0;
#endif

// TODO: reference any additional headers you need in STDAFX.H
// and not in this file
#ifdef _trace
#ifdef _WINDOWS
// https://yal.cc/printf-without-standard-library/
constexpr char prefix[] = "[catch_error] ";
void trace(const char* pszFormat, ...) {
	char buf[1024 + sizeof(prefix)];
	va_list argList;
	va_start(argList, pszFormat);
	wsprintfA(buf, "%s", prefix);
	wvsprintfA(buf + (sizeof(prefix) - 1), pszFormat, argList);
	va_end(argList);
	DWORD done;
	auto len = strlen(buf);
	buf[len] = '\n';
	buf[++len] = 0;
	WriteFile(GetStdHandle(STD_OUTPUT_HANDLE), buf, len, &done, NULL);
}
#endif
#endif

#pragma warning(disable: 28251 28252)

#ifdef tiny_memset
#pragma function(memset)
void* __cdecl memset(void* _Dst, _In_ int _Val,_In_ size_t _Size) {
	auto ptr = static_cast<uint8_t*>(_Dst);
	while (_Size) {
		*ptr++ = _Val;
		_Size--;
	}
	return _Dst;
}
#endif

#ifdef tiny_memcpy
#pragma function(memcpy)
void* memcpy(void* _Dst, const void* _Src, size_t _Size) {
	auto src8 = static_cast<const uint64_t*>(_Src);
	auto dst8 = static_cast<uint64_t*>(_Dst);
	for (; _Size > 32; _Size -= 32) {
		*dst8++ = *src8++;
		*dst8++ = *src8++;
		*dst8++ = *src8++;
		*dst8++ = *src8++;
	}
	for (; _Size > 8; _Size -= 8) *dst8++ = *src8++;
	//
	auto src1 = (const uint8_t*)(src8);
	auto dst1 = (uint8_t*)(dst8);
	for (; _Size != 0; _Size--) *dst1++ = *src1++;
	return _Dst;
}
#endif

#ifdef tiny_malloc
void* __cdecl malloc(size_t _Size) {
	return HeapAlloc(GetProcessHeap(), 0, _Size);
}
void* __cdecl realloc(void* _Block, size_t _Size) {
	return HeapReAlloc(GetProcessHeap(), 0, _Block, _Size);
}
void __cdecl free(void* _Block) {
	HeapFree(GetProcessHeap(), 0, _Block);
}
#endif

#ifdef tiny_dtoui3
// https:/stackoverflow.com/a/55011686/5578773
extern "C" unsigned int _dtoui3(const double x) {
	return (unsigned int)_mm_cvttsd_si32(_mm_set_sd(x));
}
#endif

#pragma warning(default: 28251 28252)
#include "stdafx.h"
#include <Dbghelp.h>

BOOL ModifyImportTable(IMAGE_IMPORT_DESCRIPTOR* iid, void* target, void* replacement)
{
	IMAGE_THUNK_DATA* itd = (IMAGE_THUNK_DATA*)(((char*)GetModuleHandle(NULL)) + iid->FirstThunk);

	while (itd->u1.Function)
	{
		if (((void*)itd->u1.Function) == target)
		{
			// Temporary change access to memory area to READWRITE
			MEMORY_BASIC_INFORMATION mbi;
			VirtualQuery(itd, &mbi, sizeof(MEMORY_BASIC_INFORMATION));
			VirtualProtect(mbi.BaseAddress, mbi.RegionSize, PAGE_READWRITE, &mbi.Protect);

			// Replace entry!!
			*((void**)itd) = replacement;

			// Restore memory permissions
			VirtualProtect(mbi.BaseAddress, mbi.RegionSize, mbi.Protect, &mbi.Protect);

			return TRUE;
		}

		itd += 1;
	}
	return FALSE;
}

bool striequ(const char* s1, const char* s2) {
	for (;;) {
		auto c1 = *s1++;
		auto c2 = *s2++;
		if (c1 >= 'a' && c1 <= 'z') c1 -= 'a' - 'A';
		if (c2 >= 'a' && c2 <= 'z') c2 -= 'a' - 'A';
		if (c1 == 0) return c2 == 0;
		if (c1 != c2) return false;
	}
}

BOOL InstallHook(LPCSTR module, LPCSTR function, void* hook, void** original)
{
	HMODULE process = GetModuleHandle(NULL);

	// Save original address to function
	*original = (void*)GetProcAddress(GetModuleHandleA(module), function);

	ULONG entrySize;

	IMAGE_IMPORT_DESCRIPTOR* iid = (IMAGE_IMPORT_DESCRIPTOR*)ImageDirectoryEntryToData(process, 1, IMAGE_DIRECTORY_ENTRY_IMPORT, &entrySize);

	// Search for module
	while (iid->Name)
	{
		const char* name = ((char*)process) + iid->Name;
		if (striequ(name, module))
		{
			return ModifyImportTable(iid, *original, hook);
		}
		iid += 1;
	}

	return FALSE;
}