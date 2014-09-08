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

class AskModerator < ActiveRecord::Base
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by'
  belongs_to :updated_by, :class_name => 'User', :foreign_key => 'updated_by'
  
  belongs_to :user
  belongs_to :moderator_user, :class_name => 'User'
  belongs_to :category, :class_name => 'AskCategory'
  
  validates_presence_of :ask_category_id, :user_id
  validates_uniqueness_of :user_id, :scope => :ask_category_id, :message => "is already a moderator for this category"
end
