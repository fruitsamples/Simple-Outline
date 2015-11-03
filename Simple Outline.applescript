(* Simple Outline.applescript *)

(* This is a very simple example of how to populate an outline view using a data source. It will create a data source with data items representing the following outline:

	- Things to do
		- Work on outline example
			- Make it plain and simple
			- Put it all in a "on launched" event handler
		- Put it in my iDisk when done
*)


(* ===== Event Handlers ===== *)

-- The "launched' event handler is called at the end of the startup sequence of an application. We'll use it create a data source for an outline view and manually populate it with data items.
--
on launched theObject
	-- Create the data source
	set dataSource to make new data source at end of data sources with properties {name:"tasks"}
	tell dataSource
		-- Create the data columns
		make new data column at end of data columns with properties {name:"task"}
		make new data column at end of data columns with properties {name:"completed"}
	end tell
	
	-- Create the parent item "Things to do"
	set parentItem to make new data item at end of data items of dataSource
	set contents of data cell "task" of parentItem to "Things to do"
	set contents of data cell "completed" of parentItem to "--"
	
	-- Create the parent item's children "Work on outline example
	set childItem to make new data item at end of data items of parentItem
	set contents of data cell "task" of childItem to "Work on outline example"
	set contents of data cell "completed" of childItem to "Yes"
	
	-- Create the child items of the last child item "Make it plain and simple"
	set childChildItem to make new data item at end of data items of childItem
	set contents of data cell "task" of childChildItem to "Make it plain and simple"
	set contents of data cell "completed" of childChildItem to "Yes"
	
	-- Create the child items of the last child item "Put it all in an "on launched" event handler"
	set childChildItem to make new data item at end of data items of childItem
	set contents of data cell "task" of childChildItem to "Put it all in an \"on launched'\" event handler"
	set contents of data cell "completed" of childChildItem to "Yes"
	
	-- Create the parent item's children "Put it in my iDisk when done"
	set childItem to make new data item at end of data items of parentItem
	set contents of data cell "task" of childItem to "Put it in my iDisk when done"
	set contents of data cell "completed" of childItem to "Yes"
	
	-- Assign the data source to the outline view
	set data source of outline view "tasks" of scroll view "scroll" of window "main" to dataSource
end launched


(* © Copyright 2002 Apple Computer, Inc. All rights reserved.

IMPORTANT:  This Apple software is supplied to you by Apple Computer, Inc. (“Apple”) in consideration of your agreement to the following terms, and your use, installation, modification or redistribution of this Apple software constitutes acceptance of these terms.  If you do not agree with these terms, please do not use, install, modify or redistribute this Apple software.

In consideration of your agreement to abide by the following terms, and subject to these terms, Apple grants you a personal, non-exclusive license, under Apple’s copyrights in this original Apple software (the “Apple Software”), to use, reproduce, modify and redistribute the Apple Software, with or without modifications, in source and/or binary forms; provided that if you redistribute the Apple Software in its entirety and without modifications, you must retain this notice and the following text and disclaimers in all such redistributions of the Apple Software.  Neither the name, trademarks, service marks or logos of Apple Computer, Inc. may be used to endorse or promote products derived from the Apple Software without specific prior written permission from Apple.  Except as expressly stated in this notice, no other rights or licenses, express or implied, are granted by Apple herein, including but not limited to any patent rights that may be infringed by your derivative works or by other works in which the Apple Software may be incorporated.

The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS. 

IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. *)