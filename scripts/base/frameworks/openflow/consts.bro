# All types/constants not specific to Openflow will be defined here
# unitl they somehow get into bro.

module Openflow;

# Some cookie specific constants.
# first 24 bits
const COOKIE_BID_SIZE = 16777216;
# start at bit 40 (1 << 40)
const COOKIE_BID_START = 1099511627776;
# bro specific cookie ID shall have the 42 bit set (1 << 42)
const BRO_COOKIE_ID = 4;
# 8 bits group identifier
const COOKIE_GID_SIZE = 256;
# start at bit 32 (1 << 32)
const COOKIE_GID_START = 4294967296;
# 32 bits unique identifier
const COOKIE_UID_SIZE = 4294967296;
# start at bit 0 (1 << 0)
const COOKIE_UID_START = 0;

export {
	# All ethertypes can be found at
	# http://standards.ieee.org/develop/regauth/ethertype/eth.txt
	# but are not interesting for us at this point
#type ethertype: enum {
	# Internet protocol version 4
	const ETH_IPv4 = 0x0800;
	# Address resolution protocol
	const ETH_ARP = 0x0806;
	# Wake on LAN
	const ETH_WOL = 0x0842;
	# Reverse address resolution protocol
	const ETH_RARP = 0x8035;
	# Appletalk
	const ETH_APPLETALK = 0x809B;
	# Appletalk address resolution protocol
	const ETH_APPLETALK_ARP = 0x80F3;
	# IEEE 802.1q & IEEE 802.1aq
	const ETH_VLAN = 0x8100;
	# Novell IPX old
	const ETH_IPX_OLD = 0x8137;
	# Novell IPX
	const ETH_IPX = 0x8138;
	# Internet protocol version 6
	const ETH_IPv6 = 0x86DD;
	# IEEE 802.3x
	const ETH_ETHER_FLOW_CONTROL = 0x8808;
	# Multiprotocol Label Switching unicast
	const ETH_MPLS_UNICAST = 0x8847;
	# Multiprotocol Label Switching multicast
	const ETH_MPLS_MULTICAST = 0x8848;
	# Point-to-point protocol over Ethernet discovery phase (rfc2516)
	const ETH_PPPOE_DISCOVERY = 0x8863;
	# Point-to-point protocol over Ethernet session phase (rfc2516)
	const ETH_PPPOE_SESSION = 0x8864;
	# Jumbo frames
	const ETH_JUMBO_FRAMES = 0x8870;
	# IEEE 802.1X
	const ETH_EAP_OVER_LAN = 0x888E;
	# IEEE 802.1ad & IEEE 802.1aq
	const ETH_PROVIDER_BRIDING = 0x88A8;
	# IEEE 802.1ae
	const ETH_MAC_SECURITY = 0x88E5;
	# IEEE 802.1ad (QinQ)
	const ETH_QINQ = 0x9100;
#};

	# A list of ip protocol numbers can be found at
	# http://en.wikipedia.org/wiki/List_of_IP_protocol_numbers
#type iptype: enum {
	# IPv6 Hop-by-Hop Option (RFC2460)
	const IP_HOPOPT = 0x00;
	# Internet Control Message Protocol (RFC792)
	const IP_ICMP = 0x01;
	# Internet Group Management Protocol (RFC1112)
	const IP_IGMP = 0x02;
	# Gateway-to-Gateway Protocol (RFC823)
	const IP_GGP = 0x03;
	# IP-Within-IP (encapsulation) (RFC2003)
	const IP_IPIP = 0x04;
	# Internet Stream Protocol (RFC1190;RFC1819)
	const IP_ST = 0x05;
	# Tansmission Control Protocol (RFC793)
	const IP_TCP = 0x06;
	# Core-based trees (RFC2189)
	const IP_CBT = 0x07;
	# Exterior Gateway Protocol (RFC888)
	const IP_EGP = 0x08;
	# Interior Gateway Protocol (any private interior
	# gateway (used by Cisco for their IGRP))
	const IP_IGP = 0x09;
	# User Datagram Protocol (RFC768)
	const IP_UDP = 0x11;
	# Reliable Datagram Protocol (RFC908)
	const IP_RDP = 0x1B;
	# IPv6 Encapsulation (RFC2473)
	const IP_IPv6 = 0x29;
	# Resource Reservation Protocol (RFC2205)
	const IP_RSVP = 0x2E;
	# Generic Routing Encapsulation (RFC2784;RFC2890)
	const IP_GRE = 0x2F;
	# Open Shortest Path First (RFC1583)
	const IP_OSPF = 0x59;
	# Multicast Transport Protocol
	const IP_MTP = 0x5C;
	# IP-within-IP Encapsulation Protocol (RFC2003)
	### error 0x5E;
	# Ethernet-within-IP Encapsulation Protocol (RFC3378)
	const IP_ETHERIP = 0x61;
	# Layer Two Tunneling Protocol Version 3 (RFC3931)
	const IP_L2TP = 0x73;
	# Intermediate System to Intermediate System (IS-IS) Protocol over IPv4 (RFC1142;RFC1195)
	const IP_ISIS = 0x7C;
	# Fibre Channel
	const IP_FC = 0x85;
	# Multiprotocol Label Switching Encapsulated in IP (RFC4023)
	const IP_MPLS = 0x89;
#};

	## Return value for a cookie from a flow
	## which is not added, modified or deleted
	## from the bro openflow framework
	const INVALID_COOKIE = 0xffffffffffffffff;

	# Openflow pysical port definitions
	## Maximum number of physical switch ports.
	const OFPP_MAX = 0xff00;
	## Send the packet out the input port. This
	## virual port must be explicitly used in
	## order to send back out of the input port.
	const OFPP_IN_PORT = 0xfff8;
	## Perform actions in flow table.
	## NB: This can only be the destination port
	## for packet-out messages.
	const OFPP_TABLE = 0xfff9;
	## Process with normal L2/L3 switching.
	const OFPP_NORMAL = 0xfffa;
	## All pysical ports except input port and
	## those disabled by STP.
	const OFPP_FLOOD = 0xfffb;
	## All pysical ports except input port.
	const OFPP_ALL = 0xfffc;
	## Send to controller.
	const OFPP_CONTROLLER = 0xfffd;
	## Local openflow "port".
	const OFPP_LOCAL = 0xfffe;
	## Not associated with a pysical port.
	const OFPP_NONE = 0xffff;

	## Openflow action_type definitions
	##
	## The openflow action type defines
	## what actions openflow can take
	## to modify a packet
	type ofp_action_type: enum {
		## Output to switch port.
		OFPAT_OUTPUT = 0x0000,
		## Set the 802.1q VLAN id.
		OFPAT_SET_VLAN_VID = 0x0001,
		## Set the 802.1q priority.
		OFPAT_SET_VLAN_PCP = 0x0002,
		## Strip the 802.1q header.
		OFPAT_STRIP_VLAN = 0x0003,
		## Ethernet source address.
		OFPAT_SET_DL_SRC = 0x0004,
		## Ethernet destination address.
		OFPAT_SET_DL_DST = 0x0005,
		## IP source address
		OFPAT_SET_NW_SRC = 0x0006,
		## IP destination address.
		OFPAT_SET_NW_DST = 0x0007,
		## IP ToS (DSCP field, 6 bits).
		OFPAT_SET_NW_TOS = 0x0008,
		## TCP/UDP source port.
		OFPAT_SET_TP_SRC = 0x0009,
		## TCP/UDP destination port.
		OFPAT_SET_TP_DST = 0x000a,
		## Output to queue.
		OFPAT_ENQUEUE = 0x000b,
		## Vendor specific
		OFPAT_VENDOR = 0xffff,
	};

	## Openflow flow_mod_command definitions
	##
	## The openflow flow_mod_command describes
	## of what kind an action is.
	type ofp_flow_mod_command: enum {
		## New flow.
		OFPFC_ADD = 0x0,
		## Modify all matching flows.
		OFPFC_MODIFY = 0x1,
		## Modify entry strictly matching wildcards.
		OFPFC_MODIFY_STRICT = 0x2,
		## Delete all matching flows.
		OFPFC_DELETE = 0x3,
		## Strictly matching wildcards and priority.
		OFPFC_DELETE_STRICT = 0x4,
	};

	## Openflow config flag definitions
	##
	## TODO: describe
	type ofp_config_flags: enum {
		## No special handling for fragments.
		OFPC_FRAG_NORMAL = 0,
		## Drop fragments.
		OFPC_FRAG_DROP = 1,
		## Reassemble (only if OFPC_IP_REASM set).
		OFPC_FRAG_REASM = 2,
		OFPC_FRAG_MASK = 3,
	};

	## Openflow match definition.
	##
	## The openflow match record describes
	## which packets match to a specific
	## rule in a flow table.
	type ofp_match: record {
		# Wildcard fields.
		#wildcards: count &optional;
		# Input switch port.
		in_port: count &optional;
		# Ethernet source address.
		dl_src: string &optional;
		# Ethernet destination address.
		dl_dst: string &optional;
		# Input VLAN id.
		dl_vlan: count &optional;
		# Input VLAN priority.
		dl_vlan_pcp: count &optional;
		# Ethernet frame type.
		dl_type: count &default=ETH_IPv4;
		# IP ToS (actually DSCP field, 6bits).
		nw_tos: count &optional;
		# IP protocol or lower 8 bits of ARP opcode.
		nw_proto: count &default=IP_TCP;
		# IP source address.
		nw_src: addr &optional;
		# IP destination address.
		nw_dst: addr &optional;
		# TCP/UDP source port.
		tp_src: port &optional;
		# TCP/UDP destination port.
		tp_dst: port &optional;
	};

	## Openflow actions definition.
	##
	## A action describes what should
	## happen with packets of the matching
	## flow.
	type ofp_action_output: record {
		## this should never change, but there are not
		## constants available in records
		## defaults to OFPAT_OUTPUT
		type_: ofp_action_type &default=OFPAT_OUTPUT;
		#_len: count &default=8;
		## Output port.
		port_: count &default=OFPP_FLOOD;
		#_max_len: count &optional;
	};

	# Openflow flow_mod_flags definition
	## Send flow removed message when flow
	## expires or is deleted.
	const OFPFF_SEND_FLOW_REM = 0x1;
	## Check for overlapping entries first.
	const OFPFF_CHECK_OVERLAP = 0x2;
	## Remark this is for emergency.
	## Flows added with this are only used
	## when the controller is disconnected.
	const OFPFF_EMERG = 0x4;

	## Openflow flow_mod definition.
	## It describes the flow to match and
	## how it should be modified.
	type ofp_flow_mod: record {
		# header: ofp_header;
		## Fields to match
		match: ofp_match;
		## Opaque controller-issued identifier.
		cookie: count &default=BRO_COOKIE_ID * COOKIE_BID_START;
		# Flow actions
		## One of OFPFC_*.
		command: ofp_flow_mod_command &default=OFPFC_ADD;
		## Idle time before discarding (seconds).
		idle_timeout: count &optional;
		## Max time before discarding (seconds).
		hard_timeout: count &optional;
		## Priority level of flow entry.
		priority: count &optional;
		## Buffered packet to apply to (or -1).
		## Not meaningful for OFPFC_DELETE*.
		buffer_id: count &optional;
		## For OFPFC_DELETE* commands, require
		## matching entries to include this as an
		## output port. A value of OFPP_NONE
		## indicates no restrictions.
		out_port: count &optional;
		## One of OFPFF_*.
		flags: count &optional;
		## A list of actions to perform.
		actions: vector of ofp_action_output;
	};

	## Body of reply to OFPST_FLOW request.
	type ofp_flow_stats: record {
		## Length of this entry
		_length: count;
		## ID of table flow came from.
		table_id: count;
		## Description of fields.
		match: ofp_match;
		## Time flow has been alive in seconds.
		duration_sec: count;
		## Time flow has been alive in nanoseconds beyond
		## duration_sec.
		duration_nsec: count;
		## Priority of the entry. Only meaningful
		## when this is not an exact-match entry.
		priority: count;
		## Number of seconds idle before expiration.
		idle_timeout: count;
		## Number of seconds before expiration.
		hard_timeout: count;
		## Opaque controller-issued identifier.
		cookie: count;
		## Number of packets in flow.
		packet_count: count;
		## Number of bytes in flow.
		byte_count: count;
		## Actions
		actions: vector of ofp_action_output;
	};
}
