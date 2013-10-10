module HoneyAuth::Roles
  def role
    @role_inquirer ||= ActiveSupport::StringInquirer.new(self[:role])
  end

  def role= role
    remove_instance_variable :@role_inquirer if defined?(@role_inquirer)
    safe_role_assignment role
  end

  def safe_role_assignment role
    self[:role] = if sanitized_role = SAFE_ROLES.find{ |r| r == role.strip }
      sanitized_role
    else
      'user'
    end
  end

  def assign_reserved_role role
    self[:role] = role
  end
end