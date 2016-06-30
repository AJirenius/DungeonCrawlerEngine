components {
  id: "script"
  component: "/game/game_view/wall.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
  properties {
    id: "flip_side"
    value: "1.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "has_front"
    value: "0.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "side_1"
    value: "3_1_side_1"
    type: PROPERTY_TYPE_HASH
  }
  properties {
    id: "side_2"
    value: "3_1_side_2"
    type: PROPERTY_TYPE_HASH
  }
}
embedded_components {
  id: "side"
  type: "sprite"
  data: "tile_set: \"/assets/ingame.atlas\"\n"
  "default_animation: \"3_1_side_1\"\n"
  "material: \"/render/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: -232.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
