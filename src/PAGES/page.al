pageextension 50136 "purchase order extension" extends "Purchase Order List"
{
    layout
    {
        addafter("Location Code")
        {
            field("Urgent Order"; Rec."Urgent Order")
            {
                ApplicationArea = All;
            }
            field("Delivery Deadline"; Rec."Delivery Deadline")
            {
                ApplicationArea = All;
            }
            field("Buyer Notes"; Rec."Buyer Notes")
            {
                ApplicationArea = All;
            }
            field("Order_satis"; Rec."Order_satis")
            {
                ApplicationArea = All;
            }
            //field("State"; Rec."State")
        }
    }

    actions
    {
        addafter("P&osting")
        {
            action(ApproveInternally)
            {
                Caption = 'Approve Internally';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Approve;
                ToolTip = 'Click to quickly clear this order for internal processing.';

                trigger OnAction()
                begin
                    Message('Order requests has been approved internally (Hip Hip Hurrah!)', Rec."No.");
                end;
            }

            action(SendAlert)
            {
                Caption = 'Send Alert';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Approve;
                ToolTip = 'Click to quickly clear this order for internal processing.';

                trigger OnAction()
                begin
                    if Rec."Order_satis" = Rec."Order_satis"::Bad then begin
                        Message('Ohh - No! Sorry for Inconvenience ');
                    end
                    else if Rec."Order_satis" = Rec."Order_satis"::Moderate then begin
                        Message('we will try to better our service!');
                    end
                    else if Rec."Order_satis" = Rec."Order_satis"::LovedIt then begin
                        Message('Ha - ha haaaa haaaaa You really loved it!');
                    end;
                end; // Fixed: Corrected casing and safely closed the trigger block
                     //  action(PrintCustomerReport)
                     //    {

                //    }
                //     trigger OnAction()
                //     begin

                //     end;

            }
        }
    }
}

