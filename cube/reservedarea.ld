VAR_JUMP_TABLE		= VAR_AREA + 0x00A0;	/* Dolphin OS jump table */
VAR_TVMODE			= VAR_AREA + 0x00CC;	/* TV format */

VAR_CURRENT_DISC	= VAR_AREA + 0x09B0;	/* current disc number */
VAR_DRIVE_FLAGS		= VAR_AREA + 0x09B1;	/* disc drive patched */
VAR_EMU_READ_SPEED	= VAR_AREA + 0x09B2;	/* emulate read speed */
VAR_IGR_TYPE		= VAR_AREA + 0x09B3;	/* IGR exit type */
VAR_FRAG_LIST		= VAR_AREA + 0x09B4;	/* pointer to fragments (u32 offset, u32 size, u32 rawsector) */
VAR_SD_SHIFT		= VAR_AREA + 0x09B8;	/* is the SD Card shift amount when issueing read cmds */
VAR_ATA_LBA48		= VAR_AREA + 0x09B8;	/* Is the HDD in use a 48 bit LBA supported HDD? */
VAR_EXI_SLOT		= VAR_AREA + 0x09B9;	/* is the EXI slot (0 = slot a, 1 = slot b) */
VAR_EXI_CPR			= VAR_AREA + 0x09BA;	/* is the EXI frequency (4 = 16mhz, 5 = 32mhz) */
VAR_EXI2_CPR		= VAR_AREA + 0x09BB;	/* is the EXI2 frequency (4 = 16mhz, 5 = 32mhz) */
VAR_EXI_REGS		= VAR_AREA + 0x09BC;	/* pointer to EXI registers */

VAR_DISC_1_ID		= VAR_AREA + 0x09CC;	/* disc 1 header */
VAR_DISC_2_ID		= VAR_AREA + 0x09D4;	/* disc 2 header */

VAR_NETWORK_ENV		= VAR_AREA + 0x09C0;	/* network environment variables */
VAR_CLIENT_MAC		= VAR_AREA + 0x09C0;	/* client MAC address */
VAR_ROUTER_MAC		= VAR_AREA + 0x09C6;	/* router MAC address */
VAR_CLIENT_IP		= VAR_AREA + 0x09CC;	/* client IPv4 address */
VAR_ROUTER_IP		= VAR_AREA + 0x09D0;	/* router IPv4 address */
VAR_SERVER_IP		= VAR_AREA + 0x09D4;	/* server IPv4 address */
VAR_SERVER_PORT		= VAR_AREA + 0x09D8;	/* server UDP port */
VAR_SERVER_PMTU		= VAR_AREA + 0x09DA;	/* server MTU */
VAR_EXI2_REGS		= VAR_AREA + 0x09DC;	/* pointer to EXI2 registers */

VAR_FLOAT1_6		= VAR_AREA + 0x09E0;	/* constant 1/6 */
VAR_FLOAT9_16		= VAR_AREA + 0x09E4;	/* constant 9/16 */
VAR_FLOAT3_4		= VAR_AREA + 0x09E8;	/* constant 3/4 */
VAR_FLOATM_1		= VAR_AREA + 0x09EC;	/* constant -1 */
VAR_VFILTER_ON		= VAR_AREA + 0x09F0;	/* vertical filter on */
VAR_VFILTER			= VAR_AREA + 0x09F1;	/* vertical filter */
VAR_SAR_WIDTH		= VAR_AREA + 0x09F8;	/* sample aspect ratio width */
VAR_SAR_HEIGHT		= VAR_AREA + 0x09FA;	/* sample aspect ratio height */
VAR_NEXT_FIELD		= VAR_AREA + 0x09FB;	/* next video field */
VAR_CURRENT_FIELD	= VAR_AREA + 0x09FC;	/* current video field */
VAR_TRIGGER_LEVEL	= VAR_AREA + 0x09FD;	/* digital trigger level */
VAR_CARD_IDS		= VAR_AREA + 0x09FE;	/* emulated memory cards */
VAR_CARD_A_ID		= VAR_AREA + 0x09FE;	/* emulated memory card a */
VAR_CARD_B_ID		= VAR_AREA + 0x09FF;	/* emulated memory card b */

VAR_SECTOR_BUF		= VAR_AREA + 0x0A00;	/* 0x200 of read data */

VAR_PATCHES_BASE	= VAR_AREA + 0x3000;	/* Patches get copied to below this area. */

VAR_PAD_BUTTON		= VAR_AREA + 0x30E4;	/* PAD buttons */
VAR_RMODE			= VAR_AREA + 0x30F8;	/* render mode */
