# Copyright (C) 2007  Coupa Software Incorporated http://www.coupa.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

class AttachmentFile < Attachment
  file_column :file, :fix_file_extensions => nil, :root_path => File.join(RAILS_ROOT, "storage"), :web_root => 'attachment/'
  validates_presence_of :file

  # Copy file on clone
  def clone
    new_object = super
    new_object.file = File.open(self.file)
    new_object
  end
end
