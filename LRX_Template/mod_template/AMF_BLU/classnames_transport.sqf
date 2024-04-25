// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries

box_transport_config = box_transport_config + [
    // the 'opfor_transport_truck' MUST be declared here
    [ "AMF_GBC180_PLATEAU_01", -8, [0, -0.3, 0.4], [0, -1.9, 0.4], [0, -3,5, 0,4] ],
    [ "AMF_GBC180_ViV", -8, [0, -0.3, 0.4], [0, -1.9, 0.4], [0, -3,5, 0,4] ],
    [ "AMF_GBC180_PERS_01", -8, [0, -0.3, 0.4], [0, -1.9, 0.4], [0, -3,5, 0,4] ],
    [ "amf_nh90_tth_cargo", -10, [0, -0,3, 0,4] ]
];

// Additional offset per object
// objects in this list can be loaded on vehicle position defined above

box_transport_offset = box_transport_offset + [
    // use default config
];