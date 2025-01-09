___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "US State Code and Name Converter",
  "description": "The variable can help with changing US states to abbreviation and vice versa",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "theUsStateVariableInput",
    "displayName": "US State Input",
    "description": "Enter either the state name or the abbreviation (code).",
    "simpleValueType": true
  },
  {
    "type": "RADIO",
    "name": "usStateTransformationType",
    "displayName": "Transformation Type",
    "description": "Select the type of output: full state name or abbreviation.",
    "radioItems": [
      {
        "value": "Output is the US State Code",
        "displayValue": "Convert to State Code"
      },
      {
        "value": "Output is the Full Name of the State",
        "displayValue": "Convert to Full State Name"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "LABEL",
    "name": "advvariableLabel",
    "displayName": "Advanced Options (Optional)"
  },
  {
    "type": "CHECKBOX",
    "name": "advanceTransformationConfig",
    "checkboxText": "If the input is not a valid US state name or code, return the original input instead of undefined.",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const input = data.theUsStateVariableInput ? data.theUsStateVariableInput.trim() : null;
const transformType = data.usStateTransformationType;
const useFallback = data.advanceTransformationConfig;

// Check if the input is empty or null
if (!input) {
  return undefined;
}

// State-to-name mapping
var stateMap = {
  "AL": "Alabama", "AK": "Alaska", "AZ": "Arizona", "AR": "Arkansas",
  "CA": "California", "CO": "Colorado", "CT": "Connecticut", "DE": "Delaware",
  "DC": "District of Columbia", "FL": "Florida", "GA": "Georgia", "HI": "Hawaii",
  "ID": "Idaho", "IL": "Illinois", "IN": "Indiana", "IA": "Iowa", "KS": "Kansas",
  "KY": "Kentucky", "LA": "Louisiana", "ME": "Maine", "MD": "Maryland",
  "MA": "Massachusetts", "MI": "Michigan", "MN": "Minnesota", "MS": "Mississippi",
  "MO": "Missouri", "MT": "Montana", "NE": "Nebraska", "NV": "Nevada",
  "NH": "New Hampshire", "NJ": "New Jersey", "NM": "New Mexico", "NY": "New York",
  "NC": "North Carolina", "ND": "North Dakota", "OH": "Ohio", "OK": "Oklahoma",
  "OR": "Oregon", "PA": "Pennsylvania", "RI": "Rhode Island",
  "SC": "South Carolina", "SD": "South Dakota", "TN": "Tennessee",
  "TX": "Texas", "UT": "Utah", "VT": "Vermont", "VA": "Virginia",
  "WA": "Washington", "WV": "West Virginia", "WI": "Wisconsin", "WY": "Wyoming",
  "AS": "American Samoa", "GU": "Guam", "MP": "Northern Mariana Islands",
  "PR": "Puerto Rico", "UM": "United States Minor Outlying Islands",
  "VI": "Virgin Islands"
};

// Reverse mapping (name to abbreviation)
var reverseStateMap = {};
for (var code in stateMap) {
  if (stateMap.hasOwnProperty(code)) {
    reverseStateMap[stateMap[code].toLowerCase()] = code;
  }
}

// Transformation logic
var result = null;

if (transformType === "Output is the US State Code") {
  // If input is already a valid state code, return it unchanged
  if (stateMap[input.toUpperCase()]) {
    result = input.toUpperCase();
  } else {
    // Convert full state name to code
    result = reverseStateMap[input.toLowerCase()];
  }
} else if (transformType === "Output is the Full Name of the State") {
  // If input is already a valid state name, return it unchanged
  if (reverseStateMap[input.toLowerCase()]) {
    result = input;
  } else {
    // Convert state code to full name
    result = stateMap[input.toUpperCase()];
  }
}

// Handle invalid input
if (!result) {
  result = useFallback ? input : undefined;
}

return result;


___TESTS___

scenarios: []


___NOTES___

Created on 1/9/2025, 5:59:50 PM


