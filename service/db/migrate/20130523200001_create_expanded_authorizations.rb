class CreateExpandedAuthorizations < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE VIEW expanded_authorizations AS
      SELECT
        a.id, a.node_id, n.lft, n.rgt, a.role_id, a.user_id
      FROM
        authorizations a, nodes n
      WHERE
        a.group_id is NULL AND a.node_id = n.id
      UNION
      SELECT
        a.id, a.node_id, n.lft, n.rgt, a.role_id, ug.user_id
      FROM
        authorizations a, user_groups ug, nodes n
      WHERE
        a.group_id = ug.group_id AND a.node_id = n.id
    SQL
  end
end
