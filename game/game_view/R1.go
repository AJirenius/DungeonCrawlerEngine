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
    id: "has_front"
    value: "1.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
embedded_components {
  id: "front"
  type: "sprite"
  data: "tile_set: \"/assets/ingame.atlas\"\n"
  "default_animation: \"1_front\"\n"
  "material: \"/render/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
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
}
