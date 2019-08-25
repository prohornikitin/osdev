#include <stdint.h>

struct TableHeader
{
	char signature[4];
	uint32_t length;
	uint8_t revision;
	uint8_t checksum;
	char oem_id[6];
	char oem_table_id[8];
	uint32_t oem_revision;
	uint32_t creator_id;
	uint32_t creator_revision;
};


class ACPI {

	struct Xsdt
	{
		Xsdt()
		: pointersToInfoTables(uint64_t[(header.length - sizeof(header)) / 8])
			{}
		TableHeader header;
		uint64_t pointersToInfoTables[];
	};
	public:
		TableHeader* findTable(char signature[4]) {
		    int entries = (xsdt.header.length - sizeof(xsdt.header)) / 8;
		 
		    for (int i=0; i<entries+1; ++i)
		    {
		        TableHeader* header = (TableHeader*) xsdt.pointersToInfoTables[i];
		        if (header->signature == signature)
		            return header;
		    }
		 
		    return nullptr;
		}


	private:
		
		xsdt_t xsdt;
};