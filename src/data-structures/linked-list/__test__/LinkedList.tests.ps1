Import-Module $PSScriptRoot\..\LinkedList.psd1 -Force

Describe "LinkedList" {

    it 'should append node to linked list' {
        $linkedList = New-Object LinkedList

        $linkedList.head | Should  BeNullOrEmpty
        $linkedList.tail | Should  BeNullOrEmpty
        $linkedList.append(1)
        $linkedList.append(2)

        $linkedList.ToString() | should be "1,2"
    }

    it 'should prepend node to linked list' {
        $linkedList = New-Object LinkedList

        $linkedList.Append(1)
        $linkedList.Prepend(2)

        $linkedList.ToString() | should be '2,1'
    }

    it 'should find node by value' {
        $linkedList = New-Object LinkedList

        $linkedList.Find(5) | Should BeNullOrEmpty

        $linkedList.Append(1)

        $linkedList.Find(5).value | Should BeNullOrEmpty
        $linkedList.Find(1).value | Should Be 1

        $linkedList.Append(2)
        $linkedList.Append(3)

        $node = $linkedList.Find(2)

        $node.value | Should Be 2

        $linkedList.Find(5).value | Should BeNullOrEmpty
    }
}