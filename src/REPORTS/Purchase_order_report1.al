report 50143 "Purchase Order Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'report layout/PurchaseReport.rdl';


    dataset
    {
        dataitem("puchase header"; "Purchase Header")
        {
            column(CompanyLogo; CompanyInfo.Picture) { }

            column(Vendor_Name; "Buy-from Vendor Name")
            { }
            column(GST_reg; "Vendor GST Reg. No.")
            { }
            column(Statecode; State) { }
            column(State_description; "Statedesc") { }

            dataitem("purchase line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(No_; "No.") { }
                column(quantity; "Quantity") { }
                column(hsn; "HSN/SAC Code") { }
                column(amount; "Amount") { }
                column(Unit_of_Measure; "Unit of Measure") { }
                //trigger OnAfterGetRecord()//line
                // var
                //     myInt: Integer;
                // begin

                // end;
            }
            trigger OnAfterGetRecord()//hdr
            var
                myInt: Integer;
            begin
                clear(Statedesc);
                StateRecord.Reset();
                StateRecord.SetRange(code, "puchase header".State);
                if StateRecord.FindFirst() then begin
                    Statedesc := StateRecord.Description
                end;




            end;

        }

    }
    // trigger ()
    // var
    //     myInt: Integer;
    // begin

    trigger OnPreReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);



        // Runs after user clicks Print. Great place for security or validation checks.
        if UserId = '' then
            Error('Anonymous users are not allowed to print this document.');
    end;

    var
        StateRecord: Record State;
        Statedesc: Text[100];
        CompanyInfo: Record "Company Information";
        CompanyLogoText: Text[150];
}