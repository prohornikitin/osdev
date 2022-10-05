#pragma once

#include <terminal/text_terminal.h>
#include <types.h>

namespace bootstrap {
namespace multiboot2 {

	struct TagBeginning {
		const u32 type;
		u32 size;
	}__attribute__((packed));


	struct BasicMemoryInfo {
		static const u32 type_static = 4;
		u32 type;
		u32 size;
		u32 mem_lower;
		u32 mem_upper;
	}__attribute__((packed));


	struct BootCommandLine {
		static const u32 type_static = 1;
		u32 type;
		u32 size;
		u8 string[];
	}__attribute__((packed));


	struct MemoryMap {
		static const u32 type_static = 6;
		u32 type;
		u32 size;
		u32 entry_size;
		u32 entry_version;
		struct Entry {
			u64 base_addr;
			u64 length;
			u32 type;
			u32 reserved;
		}__attribute__((packed));
		Entry entries[];
		
		u32 entriesCount() {
			u32 entriesSize = size - sizeof(type) - sizeof(size) - 
				sizeof(entry_size) - sizeof(entry_version);
			return entriesSize / entry_size;
		}
	}__attribute__((packed));


	struct FramebufferInfo {
		enum FbType : u8 {
			INDEXED_COLOR = 0,
			RGB_COLOR = 1,
			EGA_TEXT = 2,
		};

		struct ColorDescriptor {
			u8 red;
			u8 green;
			u8 blue;
		}__attribute__((packed));

		union ColorInfo {
			struct {
				u32 colors_num;
				ColorDescriptor palette[];
			}__attribute__((packed));
			struct {
				u8 framebuffer_red_field_position;
				u8 framebuffer_red_mask_size;
				u8 framebuffer_green_field_position;
				u8 framebuffer_green_mask_size;
				u8 framebuffer_blue_field_position;
				u8 framebuffer_blue_mask_size;
			}__attribute__((packed));
		};

		static const u32 type_static = 8;
		u32 type;
		u32 size;
		u64 framebuffer_addr;
		u32 framebuffer_pitch;
		u32 framebuffer_width;
		u32 framebuffer_height;
		u8 framebuffer_bpp;
		FbType framebuffer_type;
		u8 reserved;
		ColorInfo color_info;
	}__attribute__((packed));


	struct EfiSystemTablePointer64 {
		static const u32 type_static = 12;
		u32 type;
		u32 size;
		u64 pointer;
	}__attribute__((packed));


	struct Module {
		static const u32 type_static = 3;
		u32 type;
		u32 size;
		u32 addr_start;
		u32 addr_end;
		char string[];
	}__attribute__((packed));


	template<class T>
	T* findTag(u32 ptr) {
		u32* ptr32 = (u32*)ptr;
		u32 total_size = ptr32[0];
		TagBeginning* end = (TagBeginning*)(ptr + total_size);
		TagBeginning* i = (TagBeginning*)(ptr32 + 2);
		while(i < end) {
			if(i->type == T::type_static) {
				return (T*)i;
			}
			i += (i->size + 7) / 8;
		}
		return nullptr;
	}

} //multiboot2
} //bootstrap
