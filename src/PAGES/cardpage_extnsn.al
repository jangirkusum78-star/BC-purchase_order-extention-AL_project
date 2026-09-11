pageextension 50139 "cardpage extnsn " extends "Purchase Order"
{
    layout
    {
        addafter("Order Date")
        {

            field("Urgent Order"; Rec."Urgent Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if this order requires urgent processing.';
            }
            field("Delivery Deadline"; Rec."Delivery Deadline")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the targeted delivery deadline.';
            }
            field("Buyer Notes"; Rec."Buyer Notes")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies any specific buyer instructions.';
            }
            field("Order_satis"; Rec."Order_satis")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies customer satisfaction level.';
            }
        }
    }



    actions
    {
        addafter("Request Approval")
        {
            action(CustomAction)
            {
                Caption = 'Process Card Details';
                ApplicationArea = All;
                Image = Action;

                trigger OnAction()
                begin
                    Message('Processing completed for Order Number: %1', Rec."No.")
                end;
            }

            // var
            //     myInt: Integer;
        }
    }
}