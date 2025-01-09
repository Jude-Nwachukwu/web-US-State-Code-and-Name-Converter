# US State Code and Name Converter (WEB GTM)

This Google Tag Manager (GTM) custom template simplifies the process of converting US state codes (e.g., `CA`) to full state names (e.g., `California`) and vice versa. It is ideal for GTM users who need consistent state data transformations in their web analytics and tracking setups.

## Features

- **State Code to Full Name**: Convert a US state abbreviation (e.g., `NY`) to its full name (e.g., `New York`).
- **Full Name to State Code**: Convert a US state's full name (e.g., `Texas`) to its abbreviation (e.g., `TX`).
- **Handles Undefined Values**: Returns `undefined` for invalid input unless an advanced configuration is enabled.
- **Retains Original Input**: Maintains the original input if no transformation is required.

## Installation

1. Download the `template.tpl` file from this repository.
2. Import the template into your GTM container:
   - Open GTM.
   - Navigate to **Templates** > **Search Gallery** > **Import**.
   - Upload the `template.tpl` file.
3. Configure the template fields as needed.

## Usage

1. Add the custom variable to your GTM setup.
2. Configure the following fields:
   - **Input Value**: The US state abbreviation or full name to transform.
   - **Transformation Type**: Select either:
     - `US State Code Output`: Outputs the state code.
     - `Full State Name Output`: Outputs the full state name.
   - **Advanced Configuration (Optional)**: Enable to return the original input for invalid states instead of `undefined`.

## Example Scenarios

| Input Value  | Transformation Type       | Output       |
|--------------|---------------------------|--------------|
| `CA`         | Full State Name Output    | California   |
| `California` | US State Code Output      | CA           |
| `XYZ`        | Any Transformation Type   | `undefined`  |

## Development

This template was created using GTM's custom template editor and utilizes sandboxed JavaScript. Contributions are welcome!

## License

This project is licensed under the [MIT License](LICENSE).

## Support

If you encounter any issues or have suggestions, please open an issue in this repository or contact me.

