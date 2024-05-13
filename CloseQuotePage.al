page 50118 "Close Quote"
{
    PageType = Card;
    SourceTable = "Sales Header";
    ApplicationArea = All;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Quote Status"; Rec."SOL Won/Lost Quote Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Won/Last Date"; Rec."SOL Won/Last Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Won/lost Reason Code"; Rec."SOL Won/lost Reason Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Won/lost Reason Desc."; Rec."SOL Won/lost Reason Desc.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Won/lost Remarks"; Rec."SOL Won/lost Remarks")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if FORMAT(Rec."SOL Won/Lost Quote Status") = 'Won' then
            Error('This quote is already closed as "Won". You cannot modify the data.');
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = Action::LookupOK then
            FinishWizard();
    end;

    local procedure FinishWizard()
    begin
        if FORMAT(Rec."SOL Won/Lost Quote Status") <> 'Won' then begin
            Error(('QuoteStatusNotSetToWon'));
        end
        else
            if Rec."SOL Won/lost Reason Code" = '' then begin
                Error(('ReasonCodeRequired'));
            end;
    end;

}
