rename_01 = {
  matches = {
    {
      {
        "node.name",
        "equals",
        "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink"
      }
    },
  },
  apply_properties = {
    ["node.description"] = "Speakers",
    ["node.nick"] = "Main Audio Output"
  },
}

rename_02 = {
  matches = {
    {
      {
        "node.name",
        "equals",
        "alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source"
      }
    },
  },
  apply_properties = {
    ["node.description"] = "Built-in Microphone",
    ["node.nick"] = "Laptop Microphone"
  },
}


rename_03 = {
  matches = {
    {
      {
        "node.name",
        "equals",
        "alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__source"
      }
    },
  },
  apply_properties = {
    ["node.description"] = "Headphone Mic",
    ["node.nick"] = "Headphone Microphone"
  },
}


disable_extra_01 = {
  matches = {
    {
      {
        "node.name",
        "equals",
        "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_3__sink"
      }
    },
  },
  apply_properties = {
    ["node.disabled"] = true,
  },
}

disable_extra_02 = {
  matches = {
    {
      {
        "node.name",
        "equals",
        "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_4__sink"
      }
    },
  },
  apply_properties = {
    ["node.disabled"] = true,
  },
}

disable_extra_03 = {
  matches = {
    {
      {
        "node.name",
        "equals",
        "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_5__sink"
      }
    },
  },
  apply_properties = {
    ["node.disabled"] = true,
  },
}


table.insert(alsa_monitor.rules,rename_01)
table.insert(alsa_monitor.rules,rename_02)
table.insert(alsa_monitor.rules,rename_03)
table.insert(alsa_monitor.rules,disable_extra_01)
table.insert(alsa_monitor.rules,disable_extra_02)
table.insert(alsa_monitor.rules,disable_extra_03)
