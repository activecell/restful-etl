mongoose = require "mongoose"
message = require("../../message").message
__proto = require "./__proto"
Schema = mongoose.Schema
schedule = require "../../schedule"


jobSchema = new Schema
  type: {type: String, required: true}
  connection_id: String
  object: String
  grain: String
  since: String
  updated_since: String
  required_objects:
    extract: [String]
    load: [String]
    load_result: [String]

batchSchema = new Schema
  company_id: String
  tenant_id: String
  source_connection_id: String
  destination_connection_id: String
  since: String
  updated_since: String
  jobs: [jobSchema]

scheduleSchema = new Schema
  company_id: String
  tenant_id: String
  name: String
  cron_time: {type: String, required: true}
  timezone: String
  batches: [batchSchema]

class Schedule extends __proto("Schedule", scheduleSchema)
  # Creates a new schedule
  create: (doc, cb) ->
    super doc, (err, model) ->
      message model?.tenant_id, "schedule", {id: model?.id, err: err, status: "create"}
      unless err
        newSchedule = new schedule.Schedule(model)
        schedule.addSchedule newSchedule
        newSchedule.start()
      cb err, model if cb

  # Remove a schedule
  destroy: (id, cb)->
    super id, (err, model) ->
      message model?.tenant_id, "schedule", {id: model?.id, err: err, status: "destroy"}
      schedule.deleteById(id) unless err
      cb err, model if cb

  # Update schedule with changes passed to doc
  update: (id, doc, cb)->
    super id, doc, (err, model) ->
      message model?.tenant_id, "schedule", {id: model?.id, err: err, status: "update"}
      if err
        cb err, model if cb
      else
        updateSchedule = schedule.findById(id)
        updateSchedule.update model
        updateSchedule.start()
        cb err, model if cb

module.exports = Schedule
