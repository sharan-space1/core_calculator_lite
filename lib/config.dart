final List config = [
  {
    "title": "Preassure Vessel Calculations",
    "subMenu": [
      {
        "title": "Cylindrical Shell T-Min Inside Radius",
        "description": "",
        "formula": "t=PR/SE - 0.6P",
        "metadata": [
          {"type": "HEADER", "id": "H1", "name": "Input"},
          {"type": "INP", "id": "#P", "name": "Design Pressure (P)"},
          {"type": "INP", "id": "#R", "name": "Inside Raduis of Shell (R)"},
          {"type": "INP", "id": "#S", "name": "Maximum Allowable Stress (S)"},
          {"type": "INP", "id": "#E", "name": "Joint Efficiency (E)"},
          {"type": "HEADER", "id": "H2", "name": "Output"},
          {
            "type": "OUT",
            "id": "#T",
            "name": "Calculated Value",
            "formula": "(#P * #R) /((#S * #E) - (0.6 * #P))"
          },
          {"type": "BUTTON", "id": "B1", "name": "Calculate"},
        ]
      },
      {
        "title": "Cylindrical Shell T-Min Inside Radius Division 2",
        "description": "",
        "formula": "t= R(exp (P/SE) - 1)",
        "metadata": [
          {"type": "HEADER", "id": "H1", "name": "Input"},
          {"type": "INP", "id": "#P", "name": "Design Pressure (P)"},
          {"type": "INP", "id": "#R", "name": "Inside Raduis of Shell (R)"},
          {"type": "INP", "id": "#S", "name": "Maximum Allowable Stress (S)"},
          {"type": "INP", "id": "#E", "name": "Joint Efficiency (E)"},
          {"type": "HEADER", "id": "H2", "name": "Output"},
          {
            "type": "OUT",
            "id": "t",
            "name": "Calculated Value",
            "formula": "(#P * #R) /((#S * #E) - (0.6 * #P))"
          },
          {"type": "BUTTON", "id": "B1", "name": "Calculate"},
        ]
      }
    ]
  },
];
