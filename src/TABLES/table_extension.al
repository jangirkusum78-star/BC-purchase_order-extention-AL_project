tableextension 50130 "purchase order extension" extends "Purchase Header"
{
    fields
    {
        field(50131; "Urgent Order"; Boolean)

        {
            Caption = 'Urgent Order';
            DataClassification = CustomerContent;
        }

        field(50132; "Delivery Deadline"; Date)
        {
            Caption = 'Delivery Deadline';
            DataClassification = CustomerContent;

        }
        Field(50133; "Buyer Notes"; Text[150])
        {
            Caption = 'Buyer Notes';
            DataClassification = CustomerContent;
        }

        field(50134; Order_satis; Enum "Order Satisfaction")
        {
            Caption = 'Order Satisfaction ';
            DataClassification = CustomerContent;
        }


    }

    // keys
    // {
    // Add changes to keys hereff

    // fieldgroups
    // {
    //     // Add changes to field groups here
    // }

    // var
    //     myInt: Integer;
}